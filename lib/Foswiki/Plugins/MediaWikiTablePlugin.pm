# Plugin for Foswiki - The Free and Open Source Wiki, http://foswiki.org/
#
# Copyright (C) 2006-2020 Michael Daum http://michaeldaumconsulting.com
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version. For
# more details read LICENSE in the root of this distribution.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

package Foswiki::Plugins::MediaWikiTablePlugin;

use strict;
use warnings;

use Foswiki::Func ();
our $VERSION = '2.00';
our $RELEASE = '28 Oct 2020';
our $NO_PREFS_IN_TOPIC = 1;
our $SHORTDESCRIPTION = 'Format tables the <nop>MediaWiki way';
our $core;

sub initPlugin { 
  $core->init() if defined $core;
  return 1; 
}

sub getCore {
  unless (defined $core) {
    require Foswiki::Plugins::MediaWikiTablePlugin::Core;
    $core = Foswiki::Plugins::MediaWikiTablePlugin::Core->new();
  }

  return $core;
}

sub preRenderingHandler {
  getCore()->handleTables($_[0]) if $_[0] =~ /(^|[\n\r])\s*{\|/;
}

1;
