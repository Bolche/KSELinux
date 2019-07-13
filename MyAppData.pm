#
# Copyright (C) 2014-2019 KSE Team
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

package MyAppData;

sub new
{
	my $class = shift;
	my $self = { };

	bless $self, $class;

	return $self;
}

sub getusername
{
	return getlogin || getpwuid($<) || "kaleb";
}

sub getlocalappdata
{
    my ($self) = @_;
    return "C:\\Users\\" . $self->getusername() . "\\AppData\\Local";
}

sub getappdata
{
	my ($self) = @_;
	my $appdataVPlus64 = "C:\\Users\\" . $self->getusername() . "\\AppData\\Local\\VirtualStore\\Program Files (x86)\\LucasArts";
	my $appdataVPlus86 = "C:\\Users\\" . $self->getusername() . "\\AppData\\Local\\VirtualStore\\Program Files\\LucasArts";
	my $appdataVSub = "C:\\Documents and Settings\\" . $self->getusername() . "\\AppData\\Local\\VirtualStore\\Program Files\\LucasArts";

	if (opendir DIR, $appdataVPlus64) {
		close DIR;
		return $appdataVPlus64;
	} elsif (opendir DIR, $appdataVPlus86) {
		close DIR;
		return $appdataVPlus86;
	} elsif (opendir DIR, $appdataVSub) {
		close DIR;
		return $appdataVSub;
	} else {
		return "Failed to detect directory!";
	}
}

1;
