publish:
	uv version --bump patch
	git commit -am "publish: $(uv version --short)"
	git tag v`uv version --short`
	git push 
	git push origin v`uv version --short`
