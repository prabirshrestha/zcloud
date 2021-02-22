project = "hello"

app "hello" {
    build {
        use "pack" {}
        registry {
          use "docker" {
            image = "hello"
            tag   = "1"
            local = true
          }
        }
    }

    deploy {
        use "nomad" {}
    }
}
