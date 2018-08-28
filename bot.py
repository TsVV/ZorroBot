# -*- coding: utf-8 -*-

import config
import telebot
import subprocess
import os.path

# Define command and arguments
command = 'Rscript'
path2script = 'bot.r'

bot = telebot.TeleBot(config.token)

@bot.message_handler(content_types=["text"])
def repeat_all_messages(message): # The name of the function plays no role
    # Variable number of args in a list
    args = [message.text]
    file_name = message.text + '.png'
    # Build subprocess command
    cmd = [command, path2script] + args
    # check_output will run the command and store to result
    answer = subprocess.check_output(cmd, universal_newlines=True)

    bot.send_message(message.chat.id, answer)
    
    if os.path.exists(file_name):
      bot.send_photo(message.chat.id, open(file_name, 'rb'))

if __name__ == '__main__':
    bot.polling(none_stop=True)

