# --
# OTOBO is a web-based ticketing system for service organisations.
# --
# Copyright (C) 2019-2025 Rother OSS GmbH, https://otobo.io/
# --
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.
# --

package var::packagesetup::ElasticsearchFAQ;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Elasticsearch',
    'Kernel::System::GenericInterface::Webservice',
    'Kernel::System::Log',
);

=head1 NAME

var::packagesetup::ElasticsearchFAQ - code to execute during package installation

=head1 SYNOPSIS

All functions

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $CodeObject = $Kernel::OM->Get('var::packagesetup::FAQ');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # always discard the config object before package code is executed,
    # to make sure that the config object will be created newly, so that it
    # will use the recently written new config from the package
    $Kernel::OM->ObjectsDiscard(
        Objects => ['Kernel::Config'],
    );

    return $Self;
}

=item CodeInstall()

run the code install part

    my $Result = $CodeObject->CodeInstall();

=cut

sub CodeInstall {
    my ( $Self, %Param ) = @_;

    my $Success = $Self->_UpdateElasticsearchWebService(
        Action => 'Add'
    );

    return $Success;
}

=item CodeUpgrade()

run the code upgrade part

    my $Result = $CodeObject->CodeUpgrade();

=cut

sub CodeUpgrade {

    # stub
    return 1;
}

=item CodeUninstall()

run the code uninstall part

    my $Result = $CodeObject->CodeUninstall();

=cut

sub CodeUninstall {
    my ( $Self, %Param ) = @_;

    my $Success = $Self->_UpdateElasticsearchWebService(
        Action => 'Remove'
    );

    return $Success;
}

sub _UpdateElasticsearchWebService {
    my ( $Self, %Param ) = @_;

    my $WebserviceObject = $Kernel::OM->Get('Kernel::System::GenericInterface::Webservice');
    my $Webservice       = $WebserviceObject->WebserviceGet(
        Name => 'Elasticsearch',
    );

    if ( !$Webservice ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Did not find the Elasticsearch webservice!",
        );
        return;
    }

    if ( $Param{Action} eq 'Add' ) {
        $Webservice->{Config}->{Requester}->{Invoker}->{FAQIngestAttachment} = {
            Description => '',
            Type        => 'Elasticsearch::FAQManagement',
        };
        $Webservice->{Config}->{Requester}->{Invoker}->{FAQManagement} = {
            Description => '',
            Type        => 'Elasticsearch::FAQManagement',
            Events      => [
                {
                    Event        => 'FAQCreate',
                    Asynchronous => '0'
                },
                {
                    Asynchronous => '0',
                    Event        => 'FAQDelete'
                },
                {
                    Event        => 'FAQUpdate',
                    Asynchronous => '0'
                },
                {
                    Event        => 'FAQAttachmentAddPost',
                    Asynchronous => '0'
                },
                {
                    Asynchronous => '0',
                    Event        => 'FAQAttachmentDeletePost'
                }
            ],
        };
        $Webservice->{Config}->{Requester}->{Transport}->{Config}->{InvokerControllerMapping}->{FAQIngestAttachment} = {
            Command    => 'POST',
            Controller => '/tmpattachments/:docapi/:id?pipeline=:path',
        };
        $Webservice->{Config}->{Requester}->{Transport}->{Config}->{InvokerControllerMapping}->{FAQManagement} = {
            Command    => 'POST',
            Controller => '/faq/:docapi/:id',
        };
    }

    elsif ( $Param{Action} eq 'Remove' ) {
        delete $Webservice->{Config}{Requester}{Invoker}{FAQIngestAttachment};
        delete $Webservice->{Config}{Requester}{Invoker}{FAQManagement};
        delete $Webservice->{Config}{Requester}{Transport}{InvokerControllerMapping}{FAQItemIngestAttachment};
        delete $Webservice->{Config}{Requester}{Transport}{InvokerControllerMapping}{FAQManagement};
        my %IndexName = (
            index => 'faq',
        );
        $Kernel::OM->Get('Kernel::System::Elasticsearch')->DropIndex(
            IndexName => \%IndexName,
        );
    }

    else {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No Action provided!",
        );
        return;
    }

    my $Success = $WebserviceObject->WebserviceUpdate(
        %{$Webservice},
        UserID => 1,
    );

    if ( !$Success ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Could not update the Elasticsearch webservice!",
        );
        return;
    }

    return 1;
}

1;

=back
