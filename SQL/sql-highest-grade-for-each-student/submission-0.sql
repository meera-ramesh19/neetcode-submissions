-- Write your query below
WITH RankedScores AS (select student_id, exam_id, score ,
ROW_NUMBER() OVER (PARTITION BY student_id
ORDER BY score DESC, exam_id ASC) as ranking
from 
exam_results )
SELECT student_id, exam_id, score
FROM RankedScores
WHERE ranking = 1
ORDER BY student_id;