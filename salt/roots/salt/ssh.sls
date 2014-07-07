# connecting to SSH on trusty is slow because it tries to do reverse DNS; this disables it
/etc/ssh/sshd_config:
  file.append:
    - text:
      - UseDNS no
      - GSSAPIAuthentication no
