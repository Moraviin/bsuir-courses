require 'rubygems'
require 'telegram/bot'
require_relative 'response.rb'

token = '483045194:AAFCJTWGRniQ4Wkmjst_TE7Hdr9rS_miaSI'
Telegram::Bot::Client.run (token) do |bot|
  bot.listen do |message|
   names=Names.new.load_names
   if names.include?(message.text) 
     bot.api.sendMessage(chat_id: message.chat.id, text:'Yes')
   else
     bot.api.sendMessage(chat_id: message.chat.id, text:'No')
   end   
  end
end 

