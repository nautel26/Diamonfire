namespace :admin do
  desc "TODO"
  task create_admin: :environment do
    User.create(
      [
        {
          name: "Nguyen Ngoc Trung",
          username: "trungnn142",
          email: "nguyen.ngoc.trung@framgia.com",
          password: "12345678",
          password_confirmation: "12345678",
          position: User.positions[:admin]
        },
        {
          name: "Nguyen Trung Hieu",
          username: "nhieu92",
          email: "nguyen.trung.hieu@framgia.com",
          password: "12345678",
          password_confirmation: "12345678",
          position: User.positions[:admin]
        },
        {
          name: "Le Tuan Anh",
          username: "ltAnh92",
          email: "le.tuan.anh@framgia.com",
          password: "12345678",
          password_confirmation: "12345678",
          position: User.positions[:admin]
        }
      ])
  end
end
