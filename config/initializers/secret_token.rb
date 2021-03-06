# encoding: utf-8
# frozen_string_literal: true
# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# Although this is not needed for an api-only application, rails4
# requires secret_key_base or secret_token to be defined, otherwise an
# error is raised.
# Using secret_token for rails3 compatibility. Change to secret_key_base
# to avoid deprecation warning.
# Can be safely removed in a rails3 api-only application.
HiccupApi::Application.config.secret_token = 'c63760e215ccc665f523f169bd08031c502407d3ef90a4a1f15912d3afd6d75c4fea48ef7a9dd851680e4585fa9222554ad602cd21dc18e4ef6ae3ec964f42b8'
