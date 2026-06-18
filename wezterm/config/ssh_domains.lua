local M = {}

function M.apply(config)
    -- SSH 域配置
    -- 取消注释并修改为你自己的服务器信息
    config.ssh_domains = {
        -- {
        --     name = "my-server",
        --     remote_address = "example.com:22",
        --     username = "myuser",
        -- },
    }

    -- 使用 Ssh2 后端，对密码认证支持更好
    config.ssh_backend = "Ssh2"
end

return M
