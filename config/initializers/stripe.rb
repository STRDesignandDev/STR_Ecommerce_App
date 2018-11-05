if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_x2BbQOls7hIBkOB78fYjPXL0',
    secret_key: 'sk_test_vfqSySjrcl7ltJZf9L5Glax8'
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_x2BbQOls7hIBkOB78fYjPXL0',
    secret_key: 'sk_test_vfqSySjrcl7ltJZf9L5Glax8'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
