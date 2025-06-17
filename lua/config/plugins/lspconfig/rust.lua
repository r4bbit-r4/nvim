return {
    name = "rust_analyzer",
    settings = {
        ['rust-analyzer'] = {
            check = {
                command = 'clippy',
            },
        },
    },
}

