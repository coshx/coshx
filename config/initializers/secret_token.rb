# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Coshx::Application.config.secret_token = ENV['SECRET_TOKEN'] || "d6214a34784b653acd508bbb6621d04b55dcb10d5f47ff8ac4be47e32397f826e069054806b2f08be57dce307ea1665e2dccafff0ed1cacc3ebf3a0886125a91"
