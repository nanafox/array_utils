Gem::Specification.new do |s|
  s.name = "array_utils"
  s.version = "0.0.3"
  s.summary = "Useful array methods and out-of-bounds index handler"
  s.description = <<-DESC
    A simple Ruby gem that handles the issue with Ruby’s Array class when
    inserting an element at an index greater than the current array size.
    It handles this by intelligently appending the result to the end of the
    array instead of creating a sparse array.

    It also includes some other useful Array methods for common uses.
  DESC

  s.authors = [ "Maxwell Nana Forson" ]
  s.email = "maxwellnanaforson@gmail.com"

  s.files = Dir["lib/**/*.rb"]

  s.homepage = "https://github.com/nanafox/array_utils"
  s.license = "MIT"

  s.required_ruby_version = ">= 1.9"
end
