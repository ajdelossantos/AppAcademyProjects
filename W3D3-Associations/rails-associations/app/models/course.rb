class Course < ApplicationRecord

  has_many(
    :enrollments,
    class_name: 'Enrollment',
    foreign_key: :course_id,
    primary_key: :id
  )

  has_many(
    :students,
    through: :enrollments,
    source: :users
  )

  belongs_to(
    :prereq,
    class_name: 'Course',
    foreign_key: :prereq_id,
    primary_key: :id,
    optional: true
  )

  belongs_to(
    :instructor,
    class_name: 'User',
    foreign_key: :instructor_id,
    primary_key: :id
  )

end
