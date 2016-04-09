# encoding: utf-8
# frozen_string_literal: true
json.partial! 'trip'

json.share @trip.share

json.update_token @trip.update_token
