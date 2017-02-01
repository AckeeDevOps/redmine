FROM sameersbn/redmine
RUN sed -i 's/redirect_back_or_default project_time_entries_path(@time_entry.project)/redirect_to issue_path(@time_entry.issue)/' /home/redmine/redmine/app/controllers/timelog_controller.rb
