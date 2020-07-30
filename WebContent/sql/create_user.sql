drop user four CASCADE;
create user four identified by java;
grant CONNECT, RESOURCE to four;
grant restricted session to four;
conn four/java;