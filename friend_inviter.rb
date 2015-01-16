require 'mechanize'
require 'pry'

class FriendGenerator
  def initialize(email, password)
    @mechanize = Mechanize.new
    @email = email
    @password = password
  end

  def login
    page = @mechanize.get('http://www.rewardsgold.com/members/login.php')
    form = @mechanize.page.form_with(:name => "theForm")
    form.email_id = @email
    form.pwd = @password
    button = form.button_with(:value => "submit")
    @mechanize.submit(form, button)
    
  end

  def submit_friend_form
    page = @mechanize.get('http://www.rewardsgold.com/surv/referfriend.php')
    form = @mechanize.page.form_with(:name => "theform")
    form.FriendName1 = Random.rand(1000000000)
    form.FriendEmail1 = "#{Random.rand(1000000000)}@#{Random.rand(1000000000)}.com"
    form.FriendName2 = Random.rand(1000000000)
    form.FriendEmail2 = "#{Random.rand(1000000000)}@#{Random.rand(1000000000)}.com"
    button = form.button_with(:value => "Submit")
    @mechanize.submit(form, button)
    puts 'success'
  end

  def get_points
    login
    submit_friend_form
  end
end

f = FriendGenerator.new("test@example.com", "password")
f.get_points