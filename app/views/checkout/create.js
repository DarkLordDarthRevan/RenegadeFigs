console.log('hello world')
const stripe = Stripe('<%= Rails.configuration.stripe[:publishable_key] %>')

stripe.redirectToCheckout({
  sessionID: '<%= @session.id %>'
}).then(function(result){
  console.log(result.error.message)
})
