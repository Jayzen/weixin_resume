module API
  class Base < Grape::API
    mount V1::Common::Basic
    mount V1::Common::WeddingBasic
    mount V1::Common::Client
    mount V1::Common::Location
    mount V1::Common::Token
    mount V1::Common::Merchant
    mount V1::Common::Template
    mount V1::Common::Carousel
    mount V1::Common::Movie
    mount V1::Common::Menu
    mount V1::Common::Top
    mount V1::Common::State
    mount V1::Common::Recent
    mount V1::Common::HomePhotographCategory
    mount V1::Common::Affair
    mount V1::Common::OfficialAccount
    mount V1::Common::Pay
    mount V1::Common::HomeProduct
    mount V1::Common::Sort
    mount V1::Common::Address
    mount V1::Common::Order
    mount V1::Common::Product
    mount V1::Common::QrCode

    mount V1::Wedding
    mount V1::WeddingTwo
    mount V1::Resume
    mount V1::Workshop
    mount V1::Mall
    mount V1::MallTwo

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
