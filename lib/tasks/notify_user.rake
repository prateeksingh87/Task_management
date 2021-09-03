namespace :notify_user do
    desc 'saying hi to cron'
    task :notify_user_for_task_deadline => [ :environment ] do
      Task.all.each do | task | 
        # if task.status != "Done" && (Time.at(task.end_date-1.minute)  == Time.now)
        if task.status != "Done" && ( task.end_date.to_date-1.day == Date.today)
          puts "sending mail for 1 day remaining deadline"
          UserMailer.notify_user(task.user).deliver_now()
        elsif task.status != "Done" && ( Time.at(Time.now).strftime("%Y"+"/"+"%M"+"/"+"%d" + " " +"%H"+ "::"+"%M") == Time.at(Task.last.end_date-1.hour).strftime("%Y"+"/"+"%M"+"/"+"%d" + " " +"%H"+ "::"+"%M"))
          puts "sending mail for 1 hour deadline"
          UserMailer.notify_user(task.user).deliver_now()
        else
          puts "no mail is sending"
        end
      end
    end
end