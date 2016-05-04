xquery version "1.0" encoding "UTF-8";

import module namespace request = "http://exquery.org/ns/request";

declare variable $col := collection('courses');

declare variable $keyword := request:parameter('keyword', '');
declare variable $department := request:parameter('department', '');
declare variable $cat_num := request:parameter('cat_num', '');
declare variable $course_group := request:parameter('course_group', '');
declare variable $term_pattern := request:parameter('term', '');
declare variable $course_level := request:parameter('course_level', '');
declare variable $offered := request:parameter('offered', '');
declare variable $day := request:parameter('day', '');
declare variable $begin_time := request:parameter('start', '');

<courses>
{
    for $course in $col/courses/course
    let $meeting := $course/schedule/meeting
    where ($offered eq $course/@offered or $offered eq '')
    and  ($department eq $course/department/@code or $department eq '')
    and  ($cat_num eq $course/@cat_num or $cat_num eq '')
    and  ($course_group eq $course/course_group/@code or $course_group eq '')
    and  ($term_pattern eq $course/term/@term_pattern_code or $term_pattern eq '')
    and  ($course_level eq $course/course_level/@code or $course_level eq '')
    and  (contains(fn:lower-case(fn:string($course)), fn:lower-case(fn:string($keyword))) or ($keyword eq ''))
    and  ($meeting[@day = $day] or $day eq '')
    and  ($meeting[@begin_time = $begin_time] or $begin_time eq '')
    and  (
            (
              ($meeting[@term = 1] and ($course/term/@term_pattern_code = 1))
              or 
              ($meeting[@term = 2] and ($course/term/@term_pattern_code = 2))
              or
              ($course/term/@term_pattern_code = (3,4))
            ) or $term_pattern eq ''
    )
    return   $course
}
</courses>

