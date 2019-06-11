module API
  class Base < Grape::API
    mount V1::Common::Basic
    mount V1::Common::WeddingBasic
    mount V1::Common::Client
    mount V1::Common::Location
    mount V1::Common::Token
    mount V1::Common::Carousel
    mount V1::Common::Movie
    mount V1::Common::Menu
    mount V1::Common::Top
    mount V1::Common::State
    mount V1::Wedding
    mount V1::WeddingTwo
    mount V1::Resume
    mount V1::Workshop

    add_swagger_documentation(
      info: {
        title: '微信后台API',
        contact_email: 'jayzen@foxmail.com'
      },
      mount_path: '/doc/swagger',
      doc_version: '0.1.0'
    )
  end
end
