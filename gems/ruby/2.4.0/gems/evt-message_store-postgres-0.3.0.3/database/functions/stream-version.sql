CREATE OR REPLACE FUNCTION stream_version(
  _stream_name varchar
)
RETURNS int
AS $$
DECLARE
  stream_version int;
BEGIN
  select max(position) into stream_version from messages where stream_name = _stream_name;

  return stream_version;
END;
$$ LANGUAGE plpgsql;
