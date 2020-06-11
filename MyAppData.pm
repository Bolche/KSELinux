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
	return getlogin || getpwuid($<) || "eduardo";
}

sub getlocalappdata
{
    my ($self) = @_;
    return "/home/" . $self->getusername() . "/.config";
}

sub getappdata
{
	my ($self) = @_;
	my $appdata = "/home/". $self->getusername()."/.local/share/aspyr-media";
	my $appdataSteam = "/home/eduardo/". $self->getusername()."/share/Steam/steamapps/common";

	if (opendir DIR, $appdata) {
		close DIR;
		return $appdata;
	} elsif (opendir DIR, $appdataSteam) {
		close DIR;
		return $appdataSteam;
	} else {
		return "Failed to detect directory!";
	}
}

1;
