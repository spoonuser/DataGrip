create function increase_value(input_value integer)
returns integer as $$
begin
return input_value + 10;
end;
$$ language plpgsql;

create function compare_numbers(num1 integer, num2 integer, out result text)
as $$
begin
    if num1 > num2 then
        result := 'Greater';
    elsif num1 < num2 then
        result := 'Lesser';
    elsif num1 = num2 then
        result := 'Equal';
    end if;
end;
$$ language plpgsql;

create function number_series(n integer)
returns table (number integer) as $$
begin
        for number in 1..n loop
            return next number;
        end loop;
end;
    $$ language plpgsql;

create function find_employee(emp_name text)
returns table(id integer, name text, department text) as $$
    begin
        return query
        select id, name, department
        from employess
        where name = emp_name;
    end;
    $$ language plpgsql;

create function  list_products(category_name text)
returns table (product_id integer, product_name text, price numeric) as $$
    begin
        return query
        select product_id, product_name, price
        from products
        where category = category_name;
    end;
    $$ language plpgsql;

create function calculate_bonus(base_salary numeric)
returns numeric as $$
    begin
        return base_salary*0.1;
    end;
    $$ language plpgsql;

create function  update_salary(emp_id integer)
returns void as $$
declare
    current_salary numeric;
    bonus numeric;
    begin
    select salary into current_salary
    from employees
    where id = emp_id;

    bonus := calculate_bonus(current_salary)

    update employees
    set salary = salary + bonus
    where id = emp_id

end;
    $$ language plpgsql;

create function  complex_calculation(input_integer integer, input_text text)
returns text as $$
declare
    numeric_result integer;
    string_result text;
begin
    begin
        numeric_result := input_integer *2;
    end;
    begin
        string_result := input_text || 'processes';
    end;
    return 'numeric' || numeric_result || ', string' || string_result;
end;
    $$ language plpgsql;



