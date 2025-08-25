publish:
	uv version --bump patch
	rm -rf dist
	uv build
	uv publish --username __token__
