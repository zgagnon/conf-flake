(projectile-register-project-type 'bun '("package.json")
                                  :project-file "package.json"
                                  :compile "bun run build"
                                  :run "bun run start"
                                  :configure "bun install"
                                  :test "bun run test"
                                  :test-suffix ".test"
                                  )
