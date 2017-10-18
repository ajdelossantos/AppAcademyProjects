class User < ApplicationRecord
  validates :name, presence: true

  has_many(
    :enrollments,
    class_name: 'Enrollment',
    foreign_key: :student_id,
    primary_key: :id
  )

  has_many(
    :courses,
    through: :enrollments,
    source: :courses
  )



end
