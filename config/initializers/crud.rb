require "foobara/local_files_crud_driver"

Foobara::Persistence.default_crud_driver = case Rails.env
                                           when "development"
                                             # :nocov:
                                             Foobara::LocalFilesCrudDriver.new
                                             # :nocov:
                                           when "test"
                                             Foobara::Persistence::CrudDrivers::InMemory.new
                                             # rubocop:disable Lint/DuplicateBranch
                                           when "production"
                                             # TODO: change this to Redis crud driver
                                             # :nocov:
                                             Foobara::Persistence::CrudDrivers::InMemory.new
                                             # :nocov:
                                           else
                                             # rubocop:enable Lint/DuplicateBranch
                                             # :nocov:
                                             raise "Unknown environment: #{Rails.env}"
                                             # :nocov:
                                           end
