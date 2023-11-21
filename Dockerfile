FROM almalinux:latest
RUN mkdir testingroom
RUN mkdir scriptdir
COPY filewalkerscript.sh /scriptdir/filewalker.sh
RUN touch /testingroom/file1.exe
RUN touch /testingroom/file2.png
WORKDIR /testingroom/
CMD ["/scriptdir/filewalker.sh"]
