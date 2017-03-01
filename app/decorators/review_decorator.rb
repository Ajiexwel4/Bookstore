class ReviewDecorator < Drape::Decorator
  delegate_all

  def created_at
    helpers.content_tag :span, class: 'time' do
      object.created_at.strftime("%a %m/%d/%y")
    end
  end

  def user_name
    ["#{object.user.firstname}","#{object.user.lastname}"].join(' ')
  end

  def user_avatar
    object.user.avatar
  end

  def no_avatar
    user_name[0].upcase
  end

  def empty_star
    5 - object.grade
  end

  def status
    'Verified Reviewer' if object.approved?
  end
end
