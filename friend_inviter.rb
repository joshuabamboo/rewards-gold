require 'mechanize'
require 'pry'

class FriendGenerator
  def initialize(email, password, point_amount = 10001)
    @mechanize = Mechanize.new
    @email = email
    @password = password
    @point_amount = point_amount
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
  end

  def get_number_of_points
    num_of_submissions = (@point_amount/500.0).ceil #there are 500 points per submission
    num_of_submissions.times do 
      submit_friend_form
    end
    @total_num_of_points = num_of_submissions * 500
  end

  def get_points
    login
    get_number_of_points
    puts "You've successfully accumulated #{@total_num_of_points} points"
  end
end

f = FriendGenerator.new("youremail@example.com", "PASSWORD")
f.get_points