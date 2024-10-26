# tftpd-container

Container build for TFTPD project [https://github.com/altugbakan/rs-tftpd](https://github.com/altugbakan/rs-tftpd)

## Example Usage
```
docker container run --rm --name tftpd -d -it -p 6969:6969 -v ztp:/opt/ztp ghcr.io/bwks/tftpd
```