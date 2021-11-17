# -*- coding: utf-8 -*-
import os, sys
import json

import telebot

# Load tokens
tokens = {}
with open(os.path.join(sys.path[0], 'config.json')) as json_data:
    tokens = json.load(json_data)

# Init Telegram
bot = telebot.TeleBot(tokens.get('telegram_api_token'))

@bot.message_handler(content_types=["text"])
def repeat_all_messages(message): # Название функции не играет никакой роли, в принципе
    bot.send_message(message.chat.id, message.text)

if __name__ == '__main__':
    bot.polling(none_stop=True)
