FactoryGirl.define do
  factory :google_user, class: User do
    username "Ada Lovelace"
    uid '123545'
    provider "google"
    email "a@b.com"
    image "https://lh5.googleusercontent.com/-UFZ48ULhGhE/AAAAAAAAAAI/AAAAAAAAAAA/szBsj-p1MB0/photo.jpg"
  end
end
