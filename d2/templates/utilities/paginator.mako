<%def name="output_page(i, page)">
    % if i is not page:
        <a href="/guides?page=${i}">${i}</a>
    % else:
        <span>${i}</span>
    % endif
</%def>

<%def name="paginator(num_of_pages, page)">
    <div class="paginator">
        <ul class="page_numbers">
            <li>
                <a href="/guides?page=1">First</a>
            </li>
            <li>
                % if page is not 1:
                    <a href="/guides?page=${page - 1}"><< Prev</a>
                % else:
                    <span><< Prev</a>
                % endif
            </li>
            % if num_of_pages > 10:
                <%
                    if page <= 3 or page in range(num_of_pages - 4, num_of_pages + 1):
                        start = 1
                    else:
                        start = page - 3
                %>
                % for i in range(start, start + 4):
                    <li>
                        ${output_page(i, page)}
                    </li>
                % endfor
                <li>...</li>
                % for i in range(num_of_pages - 4, num_of_pages + 1):
                    <li>
                        ${output_page(i, page)}
                    </li>
                % endfor
            % else:
                % for i in range(1, num_of_pages + 1):
                    <li>
                        ${output_page(i, page)}
                    </li>
                % endfor
            % endif
            <li>
                % if page is not num_of_pages:
                    <a href="/guides?page=${page + 1}">Next >></a>
                % else:
                    <span>Next >></a>
                % endif
            </li>
            <li>
                <a href="/guides?page=${num_of_pages}">Last</a>
            </li>
        </ul>
    </div>
</%def>