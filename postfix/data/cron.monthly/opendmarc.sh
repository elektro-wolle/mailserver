#!/bin/bash
cd /etc/opendmarc
curl -so /dev/null \
  https://publicsuffix.org/list/public_suffix_list.dat > effective_tld_names.dat.new && \
  mv effective_tld_names.dat.new  effective_tld_names.dat && \
  /etc/init.d/opendmarc reload
