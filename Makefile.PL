#!/usr/bin/env perl
use ExtUtils::MakeMaker;

WriteMakefile(
		  PREREQ_PM => {'Mojolicious' => '1.21'},
		  PREREQ_PM => {'Furl' => '0.32'},
		  PREREQ_PM => {'Digest::SHA1' => '2.13'}
		);
