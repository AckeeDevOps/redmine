FROM sameersbn/redmine:3.4.7-3
# patch irritating redirect after logging time to ticket
RUN sed -i 's/redirect_back_or_default project_time_entries_path(@time_entry.project)/redirect_to issue_path(@time_entry.issue)/' /home/redmine/redmine/app/controllers/timelog_controller.rb
RUN sed -i 's/  general_csv_encoding: ISO-8859-1/  general_csv_encoding: UTF-8/g' /home/redmine/redmine/config/locales/en.yml
# patch versions form - show status field ALWAYS
COPY _form.html.erb /home/redmine/redmine/app/views/versions/_form.html.erb
COPY show.api.rsb /home/redmine/redmine/app/views/projects/show.api.rsb
# redmine_merge_request_links patch
COPY redmine_merge_request_links.patch /tmp
RUN git apply /tmp/redmine_merge_request_links.patch
