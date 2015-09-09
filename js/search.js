$(function() {
	$('#search-input').lunrSearch({
		indexUrl: '/js/index.json',
		results : '#search-results-wrapper',
		entries : '#search-entries',
		template: '#search-entry-template',
		emptyMsg: '<p class="search-results__empty-message">Nothing found</p>'
	});

	$('#search-button').on('click', function() {
		$('#search-bar-wrapper').addClass('search-bar__wrapper--visible');
		$('#search-input').focus();
	});

	$('#site-content').on('click', hideSearch);
	$('#search-clear-button').on('click', hideSearch);

	$('body').on('keyup', function(event) {
		if (event.which === 27) {
			hideSearch();
		}
	});

	function hideSearch() {
		$('#search-bar-wrapper').removeClass('search-bar__wrapper--visible');
		$('#search-results-wrapper').hide();
		$('#search-input').val('').blur();
	}
});
