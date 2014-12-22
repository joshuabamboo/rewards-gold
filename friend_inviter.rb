require 'mechanize'
require 'pry'

class FriendGenerator

  def friend
    mechanize = Mechanize.new
    page = mechanize.get('http://www.rewardsgold.com/surv/referfriend.php')
    form = mechanize.page.form_with(:name => "theform")
    form.FriendName1 = Random.rand(1000000000)
    form.FriendEmail1 = "#{Random.rand(1000000000)}@#{Random.rand(1000000000)}.com"
    form.FriendName2 = Random.rand(1000000000)
    form.FriendEmail2 = "#{Random.rand(1000000000)}@#{Random.rand(1000000000)}.com"
    button = form.button_with(:value => "Submit")
    mechanize.submit(form, button)
    puts 'success'
  end
end

f = FriendGenerator.new
f.friend

