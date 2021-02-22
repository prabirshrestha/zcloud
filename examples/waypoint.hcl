project = "hello"

app "hello" {
    build {
        use "pack" {}
    }

    deploy {
        use "nomad" {}
    }
}
