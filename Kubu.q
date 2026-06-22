project "KUBU Core" {

    meta {
        version "1.0.0"
        author "Aura Ecosystem"
        license "MIT"
    }

    blockchain {

        coin {
            name "KUBU"
            ticker "KUBU"

            consensus {
                algorithm scrypt
                auxpow true
                blocktime 54s
            }
        }

        nickname {
            register
            transfer
            renew
            release
            claimbond

            memo "KMEM1"
        }
    }

    node {
        daemon "kubud"
    }

    wallet {
        cli "kubu-cli"
        gui "kubu-qt"
        tx  "kubu-tx"
    }

    build {
        target linux
        target windows
        target macos

        dependency openssl
        dependency boost
        dependency qt
        dependency libevent
    }

    ai {
        explain
        audit
        optimize
        generate_tests
    }
}
