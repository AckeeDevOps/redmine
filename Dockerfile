FROM sameersbn/redmine:5.1.1-5

RUN sed -i 's/  general_csv_encoding: ISO-8859-1/  general_csv_encoding: UTF-8/g' /home/redmine/redmine/config/locales/en.yml

COPY redmine_merge_request_links.patch /tmp
RUN git apply /tmp/redmine_merge_request_links.patch
