if @user.nil?
	node(:success){true}
	node(:msg) {"email can be used"}
else
	node(:success){false}
	node(:msg) {"email already exists"}
end