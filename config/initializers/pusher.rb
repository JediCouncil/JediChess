require 'pusher'

Pusher.url = "https://07600f80f17ff8fb46ba:354c079db3892deb51fe@api.pusherapp.com/apps/174809"
Pusher.logger = Rails.logger

Pusher.app_id = ENV["pusher_app_id"]
Pusher.key = ENV["pusher_key"]
Pusher.secret = ENV["pusher_secret"]
