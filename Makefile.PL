#!/usr/bin/env perl
use ExtUtils::MakeMaker;

WriteMakefile(
		  PREREQ_PM => {'Mojolicious' => '1.21',
										'Furl' => '0.32',
										'Digest::SHA1' => '2.13'
										},
		);
