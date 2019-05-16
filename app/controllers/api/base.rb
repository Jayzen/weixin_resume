module API
  class Base < Grape::API
    mount V1::Shops

    add_swagger_documentation(
      info: {
        title: '微信名片API',
        contact_email: 'jayzen@foxmail.com'
      },
      mount_path: '/doc/swagger',
      doc_version: '0.1.0'
    )
  end
end
