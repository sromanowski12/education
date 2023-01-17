i450
Server Name:
infoi450-ce5a042c5e6c4f7ba1221927288502c8-dbserver.mysql.database.azure.com
Database:
infoi450_ce5a042c5e6c4f7ba1221927288502c8_database
Username:
bkvauwhwvh@infoi450-ce5a042c5e6c4f7ba1221927288502c8-dbserver
Password:
Team7Project


MySQL Tables


## WP
```php
class WP {
	/**
	 * Public query variables.
	 *
	 * Long list of public query variables.
	 *
	 * @since 2.0.0
	 * @var string[]
	 */
	public $public_query_vars = array( 'm', 'p', 'posts', 'w', 'cat', 'withcomments', 'withoutcomments', 's', 'search', 'exact', 'sentence', 'calendar', 'page', 'paged', 'more', 'tb', 'pb', 'author', 'order', 'orderby', 'year', 'monthnum', 'day', 'hour', 'minute', 'second', 'name', 'category_name', 'tag', 'feed', 'author_name', 'pagename', 'page_id', 'error', 'attachment', 'attachment_id', 'subpost', 'subpost_id', 'preview', 'robots', 'favicon', 'taxonomy', 'term', 'cpage', 'post_type', 'embed' );

	/**
	 * Private query variables.
	 *
	 * Long list of private query variables.
	 *
	 * @since 2.0.0
	 * @var string[]
	 */
	public $private_query_vars = array( 'offset', 'posts_per_page', 'posts_per_archive_page', 'showposts', 'nopaging', 'post_type', 'post_status', 'category__in', 'category__not_in', 'category__and', 'tag__in', 'tag__not_in', 'tag__and', 'tag_slug__in', 'tag_slug__and', 'tag_id', 'post_mime_type', 'perm', 'comments_per_page', 'post__in', 'post__not_in', 'post_parent', 'post_parent__in', 'post_parent__not_in', 'title', 'fields' );

	/**
	 * Extra query variables set by the user.
	 *
	 * @since 2.1.0
	 * @var array
	 */
	public $extra_query_vars = array();

	/**
	 * Query variables for setting up the WordPress Query Loop.
	 *
	 * @since 2.0.0
	 * @var array
	 */
	public $query_vars = array();

	/**
	 * String parsed to set the query variables.
	 *
	 * @since 2.0.0
	 * @var string
	 */
	public $query_string = '';

	/**
	 * The request path, e.g. 2015/05/06.
	 *
	 * @since 2.0.0
	 * @var string
	 */
	public $request = '';

	/**
	 * Rewrite rule the request matched.
	 *
	 * @since 2.0.0
	 * @var string
	 */
	public $matched_rule = '';

	/**
	 * Rewrite query the request matched.
	 *
	 * @since 2.0.0
	 * @var string
	 */
	public $matched_query = '';

	/**
	 * Whether already did the permalink.
	 *
	 * @since 2.0.0
	 * @var bool
	 */
	public $did_permalink = false;

	/**
	 * Adds a query variable to the list of public query variables.
	 *
	 * @since 2.1.0
	 *
	 * @param string $qv Query variable name.
	 */
	public function add_query_var( $qv ) {
		if ( ! in_array( $qv, $this->public_query_vars, true ) ) {
			$this->public_query_vars[] = $qv;
		}
	}

	/**
	 * Removes a query variable from a list of public query variables.
	 *
	 * @since 4.5.0
	 *
	 * @param string $name Query variable name.
	 */
	public function remove_query_var( $name ) {
		$this->public_query_vars = array_diff( $this->public_query_vars, array( $name ) );
	}

	/**
	 * Sets the value of a query variable.
	 *
	 * @since 2.3.0
	 *
	 * @param string $key   Query variable name.
	 * @param mixed  $value Query variable value.
	 */
	public function set_query_var( $key, $value ) {
		$this->query_vars[ $key ] = $value;
	}

	/**
	 * Parses the request to find the correct WordPress query.
	 *
	 * Sets up the query variables based on the request. There are also many
	 * filters and actions that can be used to further manipulate the result.
	 *
	 * @since 2.0.0
	 * @since 6.0.0 A return value was added.
	 *
	 * @global WP_Rewrite $wp_rewrite WordPress rewrite component.
	 *
	 * @param array|string $extra_query_vars Set the extra query variables.
	 * @return bool Whether the request was parsed.
	 */
	public function parse_request( $extra_query_vars = '' ) {
		global $wp_rewrite;

		/**
		 * Filters whether to parse the request.
		 *
		 * @since 3.5.0
		 *
		 * @param bool         $bool             Whether or not to parse the request. Default true.
		 * @param WP           $wp               Current WordPress environment instance.
		 * @param array|string $extra_query_vars Extra passed query variables.
		 */
		if ( ! apply_filters( 'do_parse_request', true, $this, $extra_query_vars ) ) {
			return false;
		}

		$this->query_vars     = array();
		$post_type_query_vars = array();

		if ( is_array( $extra_query_vars ) ) {
			$this->extra_query_vars = & $extra_query_vars;
		} elseif ( ! empty( $extra_query_vars ) ) {
			parse_str( $extra_query_vars, $this->extra_query_vars );
		}
		// Process PATH_INFO, REQUEST_URI, and 404 for permalinks.

		// Fetch the rewrite rules.
		$rewrite = $wp_rewrite->wp_rewrite_rules();

		if ( ! empty( $rewrite ) ) {
			// If we match a rewrite rule, this will be cleared.
			$error               = '404';
			$this->did_permalink = true;

			$pathinfo         = isset( $_SERVER['PATH_INFO'] ) ? $_SERVER['PATH_INFO'] : '';
			list( $pathinfo ) = explode( '?', $pathinfo );
			$pathinfo         = str_replace( '%', '%25', $pathinfo );

			list( $req_uri ) = explode( '?', $_SERVER['REQUEST_URI'] );
			$self            = $_SERVER['PHP_SELF'];

			$home_path       = parse_url( home_url(), PHP_URL_PATH );
			$home_path_regex = '';
			if ( is_string( $home_path ) && '' !== $home_path ) {
				$home_path       = trim( $home_path, '/' );
				$home_path_regex = sprintf( '|^%s|i', preg_quote( $home_path, '|' ) );
			}

			/*
			 * Trim path info from the end and the leading home path from the front.
			 * For path info requests, this leaves us with the requesting filename, if any.
			 * For 404 requests, this leaves us with the requested permalink.
			 */
			$req_uri  = str_replace( $pathinfo, '', $req_uri );
			$req_uri  = trim( $req_uri, '/' );
			$pathinfo = trim( $pathinfo, '/' );
			$self     = trim( $self, '/' );

			if ( ! empty( $home_path_regex ) ) {
				$req_uri  = preg_replace( $home_path_regex, '', $req_uri );
				$req_uri  = trim( $req_uri, '/' );
				$pathinfo = preg_replace( $home_path_regex, '', $pathinfo );
				$pathinfo = trim( $pathinfo, '/' );
				$self     = preg_replace( $home_path_regex, '', $self );
				$self     = trim( $self, '/' );
			}

			// The requested permalink is in $pathinfo for path info requests and
			// $req_uri for other requests.
			if ( ! empty( $pathinfo ) && ! preg_match( '|^.*' . $wp_rewrite->index . '$|', $pathinfo ) ) {
				$requested_path = $pathinfo;
			} else {
				// If the request uri is the index, blank it out so that we don't try to match it against a rule.
				if ( $req_uri == $wp_rewrite->index ) {
					$req_uri = '';
				}
				$requested_path = $req_uri;
			}
			$requested_file = $req_uri;

			$this->request = $requested_path;

			// Look for matches.
			$request_match = $requested_path;
			if ( empty( $request_match ) ) {
				// An empty request could only match against ^$ regex.
				if ( isset( $rewrite['$'] ) ) {
					$this->matched_rule = '$';
					$query              = $rewrite['$'];
					$matches            = array( '' );
				}
			} else {
				foreach ( (array) $rewrite as $match => $query ) {
					// If the requested file is the anchor of the match, prepend it to the path info.
					if ( ! empty( $requested_file ) && strpos( $match, $requested_file ) === 0 && $requested_file != $requested_path ) {
						$request_match = $requested_file . '/' . $requested_path;
					}

					if ( preg_match( "#^$match#", $request_match, $matches ) ||
						preg_match( "#^$match#", urldecode( $request_match ), $matches ) ) {

						if ( $wp_rewrite->use_verbose_page_rules && preg_match( '/pagename=\$matches\[([0-9]+)\]/', $query, $varmatch ) ) {
							// This is a verbose page match, let's check to be sure about it.
							$page = get_page_by_path( $matches[ $varmatch[1] ] );
							if ( ! $page ) {
								continue;
							}

							$post_status_obj = get_post_status_object( $page->post_status );
							if ( ! $post_status_obj->public && ! $post_status_obj->protected
								&& ! $post_status_obj->private && $post_status_obj->exclude_from_search ) {
								continue;
							}
						}

						// Got a match.
						$this->matched_rule = $match;
						break;
					}
				}
			}

			if ( ! empty( $this->matched_rule ) ) {
				// Trim the query of everything up to the '?'.
				$query = preg_replace( '!^.+\?!', '', $query );

				// Substitute the substring matches into the query.
				$query = addslashes( WP_MatchesMapRegex::apply( $query, $matches ) );

				$this->matched_query = $query;

				// Parse the query.
				parse_str( $query, $perma_query_vars );

				// If we're processing a 404 request, clear the error var since we found something.
				if ( '404' == $error ) {
					unset( $error, $_GET['error'] );
				}
			}

			// If req_uri is empty or if it is a request for ourself, unset error.
			if ( empty( $requested_path ) || $requested_file == $self || strpos( $_SERVER['PHP_SELF'], 'wp-admin/' ) !== false ) {
				unset( $error, $_GET['error'] );

				if ( isset( $perma_query_vars ) && strpos( $_SERVER['PHP_SELF'], 'wp-admin/' ) !== false ) {
					unset( $perma_query_vars );
				}

				$this->did_permalink = false;
			}
		}

		/**
		 * Filters the query variables allowed before processing.
		 *
		 * Allows (publicly allowed) query vars to be added, removed, or changed prior
		 * to executing the query. Needed to allow custom rewrite rules using your own arguments
		 * to work, or any other custom query variables you want to be publicly available.
		 *
		 * @since 1.5.0
		 *
		 * @param string[] $public_query_vars The array of allowed query variable names.
		 */
		$this->public_query_vars = apply_filters( 'query_vars', $this->public_query_vars );

		foreach ( get_post_types( array(), 'objects' ) as $post_type => $t ) {
			if ( is_post_type_viewable( $t ) && $t->query_var ) {
				$post_type_query_vars[ $t->query_var ] = $post_type;
			}
		}

		foreach ( $this->public_query_vars as $wpvar ) {
			if ( isset( $this->extra_query_vars[ $wpvar ] ) ) {
				$this->query_vars[ $wpvar ] = $this->extra_query_vars[ $wpvar ];
			} elseif ( isset( $_GET[ $wpvar ] ) && isset( $_POST[ $wpvar ] ) && $_GET[ $wpvar ] !== $_POST[ $wpvar ] ) {
				wp_die( __( 'A variable mismatch has been detected.' ), __( 'Sorry, you are not allowed to view this item.' ), 400 );
			} elseif ( isset( $_POST[ $wpvar ] ) ) {
				$this->query_vars[ $wpvar ] = $_POST[ $wpvar ];
			} elseif ( isset( $_GET[ $wpvar ] ) ) {
				$this->query_vars[ $wpvar ] = $_GET[ $wpvar ];
			} elseif ( isset( $perma_query_vars[ $wpvar ] ) ) {
				$this->query_vars[ $wpvar ] = $perma_query_vars[ $wpvar ];
			}

			if ( ! empty( $this->query_vars[ $wpvar ] ) ) {
				if ( ! is_array( $this->query_vars[ $wpvar ] ) ) {
					$this->query_vars[ $wpvar ] = (string) $this->query_vars[ $wpvar ];
				} else {
					foreach ( $this->query_vars[ $wpvar ] as $vkey => $v ) {
						if ( is_scalar( $v ) ) {
							$this->query_vars[ $wpvar ][ $vkey ] = (string) $v;
						}
					}
				}

				if ( isset( $post_type_query_vars[ $wpvar ] ) ) {
					$this->query_vars['post_type'] = $post_type_query_vars[ $wpvar ];
					$this->query_vars['name']      = $this->query_vars[ $wpvar ];
				}
			}
		}

		// Convert urldecoded spaces back into '+'.
		foreach ( get_taxonomies( array(), 'objects' ) as $taxonomy => $t ) {
			if ( $t->query_var && isset( $this->query_vars[ $t->query_var ] ) ) {
				$this->query_vars[ $t->query_var ] = str_replace( ' ', '+', $this->query_vars[ $t->query_var ] );
			}
		}

		// Don't allow non-publicly queryable taxonomies to be queried from the front end.
		if ( ! is_admin() ) {
			foreach ( get_taxonomies( array( 'publicly_queryable' => false ), 'objects' ) as $taxonomy => $t ) {
				/*
				 * Disallow when set to the 'taxonomy' query var.
				 * Non-publicly queryable taxonomies cannot register custom query vars. See register_taxonomy().
				 */
				if ( isset( $this->query_vars['taxonomy'] ) && $taxonomy === $this->query_vars['taxonomy'] ) {
					unset( $this->query_vars['taxonomy'], $this->query_vars['term'] );
				}
			}
		}

		// Limit publicly queried post_types to those that are 'publicly_queryable'.
		if ( isset( $this->query_vars['post_type'] ) ) {
			$queryable_post_types = get_post_types( array( 'publicly_queryable' => true ) );
			if ( ! is_array( $this->query_vars['post_type'] ) ) {
				if ( ! in_array( $this->query_vars['post_type'], $queryable_post_types, true ) ) {
					unset( $this->query_vars['post_type'] );
				}
			} else {
				$this->query_vars['post_type'] = array_intersect( $this->query_vars['post_type'], $queryable_post_types );
			}
		}

		// Resolve conflicts between posts with numeric slugs and date archive queries.
		$this->query_vars = wp_resolve_numeric_slug_conflicts( $this->query_vars );

		foreach ( (array) $this->private_query_vars as $var ) {
			if ( isset( $this->extra_query_vars[ $var ] ) ) {
				$this->query_vars[ $var ] = $this->extra_query_vars[ $var ];
			}
		}

		if ( isset( $error ) ) {
			$this->query_vars['error'] = $error;
		}

		/**
		 * Filters the array of parsed query variables.
		 *
		 * @since 2.1.0
		 *
		 * @param array $query_vars The array of requested query variables.
		 */
		$this->query_vars = apply_filters( 'request', $this->query_vars );

		/**
		 * Fires once all query variables for the current request have been parsed.
		 *
		 * @since 2.1.0
		 *
		 * @param WP $wp Current WordPress environment instance (passed by reference).
		 */
		do_action_ref_array( 'parse_request', array( &$this ) );

		return true;
	}

	/**
	 * Sends additional HTTP headers for caching, content type, etc.
	 *
	 * Sets the Content-Type header. Sets the 'error' status (if passed) and optionally exits.
	 * If showing a feed, it will also send Last-Modified, ETag, and 304 status if needed.
	 *
	 * @since 2.0.0
	 * @since 4.4.0 `X-Pingback` header is added conditionally after posts have been queried in handle_404().
	 */
	public function send_headers() {
		$headers       = array();
		$status        = null;
		$exit_required = false;
		$date_format   = 'D, d M Y H:i:s';

		if ( is_user_logged_in() ) {
			$headers = array_merge( $headers, wp_get_nocache_headers() );
		} elseif ( ! empty( $_GET['unapproved'] ) && ! empty( $_GET['moderation-hash'] ) ) {
			// Unmoderated comments are only visible for 10 minutes via the moderation hash.
			$expires = 10 * MINUTE_IN_SECONDS;

			$headers['Expires']       = gmdate( $date_format, time() + $expires );
			$headers['Cache-Control'] = sprintf(
				'max-age=%d, must-revalidate',
				$expires
			);
		}
		if ( ! empty( $this->query_vars['error'] ) ) {
			$status = (int) $this->query_vars['error'];
			if ( 404 === $status ) {
				if ( ! is_user_logged_in() ) {
					$headers = array_merge( $headers, wp_get_nocache_headers() );
				}
				$headers['Content-Type'] = get_option( 'html_type' ) . '; charset=' . get_option( 'blog_charset' );
			} elseif ( in_array( $status, array( 403, 500, 502, 503 ), true ) ) {
				$exit_required = true;
			}
		} elseif ( empty( $this->query_vars['feed'] ) ) {
			$headers['Content-Type'] = get_option( 'html_type' ) . '; charset=' . get_option( 'blog_charset' );
		} else {
			// Set the correct content type for feeds.
			$type = $this->query_vars['feed'];
			if ( 'feed' === $this->query_vars['feed'] ) {
				$type = get_default_feed();
			}
			$headers['Content-Type'] = feed_content_type( $type ) . '; charset=' . get_option( 'blog_charset' );

			// We're showing a feed, so WP is indeed the only thing that last changed.
			if ( ! empty( $this->query_vars['withcomments'] )
				|| false !== strpos( $this->query_vars['feed'], 'comments-' )
				|| ( empty( $this->query_vars['withoutcomments'] )
					&& ( ! empty( $this->query_vars['p'] )
						|| ! empty( $this->query_vars['name'] )
						|| ! empty( $this->query_vars['page_id'] )
						|| ! empty( $this->query_vars['pagename'] )
						|| ! empty( $this->query_vars['attachment'] )
						|| ! empty( $this->query_vars['attachment_id'] )
					)
				)
			) {
				$wp_last_modified_post    = mysql2date( $date_format, get_lastpostmodified( 'GMT' ), false );
				$wp_last_modified_comment = mysql2date( $date_format, get_lastcommentmodified( 'GMT' ), false );
				if ( strtotime( $wp_last_modified_post ) > strtotime( $wp_last_modified_comment ) ) {
					$wp_last_modified = $wp_last_modified_post;
				} else {
					$wp_last_modified = $wp_last_modified_comment;
				}
			} else {
				$wp_last_modified = mysql2date( $date_format, get_lastpostmodified( 'GMT' ), false );
			}

			if ( ! $wp_last_modified ) {
				$wp_last_modified = gmdate( $date_format );
			}

			$wp_last_modified .= ' GMT';

			$wp_etag                  = '"' . md5( $wp_last_modified ) . '"';
			$headers['Last-Modified'] = $wp_last_modified;
			$headers['ETag']          = $wp_etag;

			// Support for conditional GET.
			if ( isset( $_SERVER['HTTP_IF_NONE_MATCH'] ) ) {
				$client_etag = wp_unslash( $_SERVER['HTTP_IF_NONE_MATCH'] );
			} else {
				$client_etag = false;
			}

			$client_last_modified = empty( $_SERVER['HTTP_IF_MODIFIED_SINCE'] ) ? '' : trim( $_SERVER['HTTP_IF_MODIFIED_SINCE'] );
			// If string is empty, return 0. If not, attempt to parse into a timestamp.
			$client_modified_timestamp = $client_last_modified ? strtotime( $client_last_modified ) : 0;

			// Make a timestamp for our most recent modification..
			$wp_modified_timestamp = strtotime( $wp_last_modified );

			if ( ( $client_last_modified && $client_etag ) ?
					( ( $client_modified_timestamp >= $wp_modified_timestamp ) && ( $client_etag == $wp_etag ) ) :
					( ( $client_modified_timestamp >= $wp_modified_timestamp ) || ( $client_etag == $wp_etag ) ) ) {
				$status        = 304;
				$exit_required = true;
			}
		}

		/**
		 * Filters the HTTP headers before they're sent to the browser.
		 *
		 * @since 2.8.0
		 *
		 * @param string[] $headers Associative array of headers to be sent.
		 * @param WP       $wp      Current WordPress environment instance.
		 */
		$headers = apply_filters( 'wp_headers', $headers, $this );

		if ( ! empty( $status ) ) {
			status_header( $status );
		}

		// If Last-Modified is set to false, it should not be sent (no-cache situation).
		if ( isset( $headers['Last-Modified'] ) && false === $headers['Last-Modified'] ) {
			unset( $headers['Last-Modified'] );

			if ( ! headers_sent() ) {
				header_remove( 'Last-Modified' );
			}
		}

		if ( ! headers_sent() ) {
			foreach ( (array) $headers as $name => $field_value ) {
				header( "{$name}: {$field_value}" );
			}
		}

		if ( $exit_required ) {
			exit;
		}

		/**
		 * Fires once the requested HTTP headers for caching, content type, etc. have been sent.
		 *
		 * @since 2.1.0
		 *
		 * @param WP $wp Current WordPress environment instance (passed by reference).
		 */
		do_action_ref_array( 'send_headers', array( &$this ) );
	}

	/**
	 * Sets the query string property based off of the query variable property.
	 *
	 * The {@see 'query_string'} filter is deprecated, but still works. Plugins should
	 * use the {@see 'request'} filter instead.
	 *
	 * @since 2.0.0
	 */
	public function build_query_string() {
		$this->query_string = '';
		foreach ( (array) array_keys( $this->query_vars ) as $wpvar ) {
			if ( '' != $this->query_vars[ $wpvar ] ) {
				$this->query_string .= ( strlen( $this->query_string ) < 1 ) ? '' : '&';
				if ( ! is_scalar( $this->query_vars[ $wpvar ] ) ) { // Discard non-scalars.
					continue;
				}
				$this->query_string .= $wpvar . '=' . rawurlencode( $this->query_vars[ $wpvar ] );
			}
		}

		if ( has_filter( 'query_string' ) ) {  // Don't bother filtering and parsing if no plugins are hooked in.
			/**
			 * Filters the query string before parsing.
			 *
			 * @since 1.5.0
			 * @deprecated 2.1.0 Use {@see 'query_vars'} or {@see 'request'} filters instead.
			 *
			 * @param string $query_string The query string to modify.
			 */
			$this->query_string = apply_filters_deprecated(
				'query_string',
				array( $this->query_string ),
				'2.1.0',
				'query_vars, request'
			);
			parse_str( $this->query_string, $this->query_vars );
		}
	}

	/**
	 * Set up the WordPress Globals.
	 *
	 * The query_vars property will be extracted to the GLOBALS. So care should
	 * be taken when naming global variables that might interfere with the
	 * WordPress environment.
	 *
	 * @since 2.0.0
	 *
	 * @global WP_Query     $wp_query     WordPress Query object.
	 * @global string       $query_string Query string for the loop.
	 * @global array        $posts        The found posts.
	 * @global WP_Post|null $post         The current post, if available.
	 * @global string       $request      The SQL statement for the request.
	 * @global int          $more         Only set, if single page or post.
	 * @global int          $single       If single page or post. Only set, if single page or post.
	 * @global WP_User      $authordata   Only set, if author archive.
	 */
	public function register_globals() {
		global $wp_query;

		// Extract updated query vars back into global namespace.
		foreach ( (array) $wp_query->query_vars as $key => $value ) {
			$GLOBALS[ $key ] = $value;
		}

		$GLOBALS['query_string'] = $this->query_string;
		$GLOBALS['posts']        = & $wp_query->posts;
		$GLOBALS['post']         = isset( $wp_query->post ) ? $wp_query->post : null;
		$GLOBALS['request']      = $wp_query->request;

		if ( $wp_query->is_single() || $wp_query->is_page() ) {
			$GLOBALS['more']   = 1;
			$GLOBALS['single'] = 1;
		}

		if ( $wp_query->is_author() ) {
			$GLOBALS['authordata'] = get_userdata( get_queried_object_id() );
		}
	}

	/**
	 * Set up the current user.
	 *
	 * @since 2.0.0
	 */
	public function init() {
		wp_get_current_user();
	}

	/**
	 * Set up the Loop based on the query variables.
	 *
	 * @since 2.0.0
	 *
	 * @global WP_Query $wp_the_query WordPress Query object.
	 */
	public function query_posts() {
		global $wp_the_query;
		$this->build_query_string();
		$wp_the_query->query( $this->query_vars );
	}

	/**
	 * Set the Headers for 404, if nothing is found for requested URL.
	 *
	 * Issue a 404 if a request doesn't match any posts and doesn't match any object
	 * (e.g. an existing-but-empty category, tag, author) and a 404 was not already issued,
	 * and if the request was not a search or the homepage.
	 *
	 * Otherwise, issue a 200.
	 *
	 * This sets headers after posts have been queried. handle_404() really means "handle status".
	 * By inspecting the result of querying posts, seemingly successful requests can be switched to
	 * a 404 so that canonical redirection logic can kick in.
	 *
	 * @since 2.0.0
	 *
	 * @global WP_Query $wp_query WordPress Query object.
	 */
	public function handle_404() {
		global $wp_query;

		/**
		 * Filters whether to short-circuit default header status handling.
		 *
		 * Returning a non-false value from the filter will short-circuit the handling
		 * and return early.
		 *
		 * @since 4.5.0
		 *
		 * @param bool     $preempt  Whether to short-circuit default header status handling. Default false.
		 * @param WP_Query $wp_query WordPress Query object.
		 */
		if ( false !== apply_filters( 'pre_handle_404', false, $wp_query ) ) {
			return;
		}

		// If we've already issued a 404, bail.
		if ( is_404() ) {
			return;
		}

		$set_404 = true;

		// Never 404 for the admin, robots, or favicon.
		if ( is_admin() || is_robots() || is_favicon() ) {
			$set_404 = false;

			// If posts were found, check for paged content.
		} elseif ( $wp_query->posts ) {
			$content_found = true;

			if ( is_singular() ) {
				$post = isset( $wp_query->post ) ? $wp_query->post : null;

				// Only set X-Pingback for single posts that allow pings.
				if ( $post && pings_open( $post ) && ! headers_sent() ) {
					header( 'X-Pingback: ' . get_bloginfo( 'pingback_url', 'display' ) );
				}

				// Check for paged content that exceeds the max number of pages.
				$next = '<!--nextpage-->';
				if ( $post && ! empty( $this->query_vars['page'] ) ) {
					// Check if content is actually intended to be paged.
					if ( false !== strpos( $post->post_content, $next ) ) {
						$page          = trim( $this->query_vars['page'], '/' );
						$content_found = (int) $page <= ( substr_count( $post->post_content, $next ) + 1 );
					} else {
						$content_found = false;
					}
				}
			}

			// The posts page does not support the <!--nextpage--> pagination.
			if ( $wp_query->is_posts_page && ! empty( $this->query_vars['page'] ) ) {
				$content_found = false;
			}

			if ( $content_found ) {
				$set_404 = false;
			}

			// We will 404 for paged queries, as no posts were found.
		} elseif ( ! is_paged() ) {
			$author = get_query_var( 'author' );

			// Don't 404 for authors without posts as long as they matched an author on this site.
			if ( is_author() && is_numeric( $author ) && $author > 0 && is_user_member_of_blog( $author )
				// Don't 404 for these queries if they matched an object.
				|| ( is_tag() || is_category() || is_tax() || is_post_type_archive() ) && get_queried_object()
				// Don't 404 for these queries either.
				|| is_home() || is_search() || is_feed()
			) {
				$set_404 = false;
			}
		}

		if ( $set_404 ) {
			// Guess it's time to 404.
			$wp_query->set_404();
			status_header( 404 );
			nocache_headers();
		} else {
			status_header( 200 );
		}
	}

	/**
	 * Sets up all of the variables required by the WordPress environment.
	 *
	 * The action {@see 'wp'} has one parameter that references the WP object. It
	 * allows for accessing the properties and methods to further manipulate the
	 * object.
	 *
	 * @since 2.0.0
	 *
	 * @param string|array $query_args Passed to parse_request().
	 */
	public function main( $query_args = '' ) {
		$this->init();

		$parsed = $this->parse_request( $query_args );

		$this->send_headers();

		if ( $parsed ) {
			$this->query_posts();
			$this->handle_404();
			$this->register_globals();
		}

		/**
		 * Fires once the WordPress environment has been set up.
		 *
		 * @since 2.1.0
		 *
		 * @param WP $wp Current WordPress environment instance (passed by reference).
		 */
		do_action_ref_array( 'wp', array( &$this ) );
	}
}

```

## WP_Comment
```php
final class WP_Comment {

	/**
	 * Comment ID.
	 *
	 * A numeric string, for compatibility reasons.
	 *
	 * @since 4.4.0
	 * @var string
	 */
	public $comment_ID;

	/**
	 * ID of the post the comment is associated with.
	 *
	 * A numeric string, for compatibility reasons.
	 *
	 * @since 4.4.0
	 * @var string
	 */
	public $comment_post_ID = 0;

	/**
	 * Comment author name.
	 *
	 * @since 4.4.0
	 * @var string
	 */
	public $comment_author = '';

	/**
	 * Comment author email address.
	 *
	 * @since 4.4.0
	 * @var string
	 */
	public $comment_author_email = '';

	/**
	 * Comment author URL.
	 *
	 * @since 4.4.0
	 * @var string
	 */
	public $comment_author_url = '';

	/**
	 * Comment author IP address (IPv4 format).
	 *
	 * @since 4.4.0
	 * @var string
	 */
	public $comment_author_IP = '';

	/**
	 * Comment date in YYYY-MM-DD HH:MM:SS format.
	 *
	 * @since 4.4.0
	 * @var string
	 */
	public $comment_date = '0000-00-00 00:00:00';

	/**
	 * Comment GMT date in YYYY-MM-DD HH::MM:SS format.
	 *
	 * @since 4.4.0
	 * @var string
	 */
	public $comment_date_gmt = '0000-00-00 00:00:00';

	/**
	 * Comment content.
	 *
	 * @since 4.4.0
	 * @var string
	 */
	public $comment_content;

	/**
	 * Comment karma count.
	 *
	 * A numeric string, for compatibility reasons.
	 *
	 * @since 4.4.0
	 * @var string
	 */
	public $comment_karma = 0;

	/**
	 * Comment approval status.
	 *
	 * @since 4.4.0
	 * @var string
	 */
	public $comment_approved = '1';

	/**
	 * Comment author HTTP user agent.
	 *
	 * @since 4.4.0
	 * @var string
	 */
	public $comment_agent = '';

	/**
	 * Comment type.
	 *
	 * @since 4.4.0
	 * @since 5.5.0 Default value changed to `comment`.
	 * @var string
	 */
	public $comment_type = 'comment';

	/**
	 * Parent comment ID.
	 *
	 * A numeric string, for compatibility reasons.
	 *
	 * @since 4.4.0
	 * @var string
	 */
	public $comment_parent = 0;

	/**
	 * Comment author ID.
	 *
	 * A numeric string, for compatibility reasons.
	 *
	 * @since 4.4.0
	 * @var string
	 */
	public $user_id = 0;

	/**
	 * Comment children.
	 *
	 * @since 4.4.0
	 * @var array
	 */
	protected $children;

	/**
	 * Whether children have been populated for this comment object.
	 *
	 * @since 4.4.0
	 * @var bool
	 */
	protected $populated_children = false;

	/**
	 * Post fields.
	 *
	 * @since 4.4.0
	 * @var array
	 */
	protected $post_fields = array( 'post_author', 'post_date', 'post_date_gmt', 'post_content', 'post_title', 'post_excerpt', 'post_status', 'comment_status', 'ping_status', 'post_name', 'to_ping', 'pinged', 'post_modified', 'post_modified_gmt', 'post_content_filtered', 'post_parent', 'guid', 'menu_order', 'post_type', 'post_mime_type', 'comment_count' );

	/**
	 * Retrieves a WP_Comment instance.
	 *
	 * @since 4.4.0
	 *
	 * @global wpdb $wpdb WordPress database abstraction object.
	 *
	 * @param int $id Comment ID.
	 * @return WP_Comment|false Comment object, otherwise false.
	 */
	public static function get_instance( $id ) {
		global $wpdb;

		$comment_id = (int) $id;
		if ( ! $comment_id ) {
			return false;
		}

		$_comment = wp_cache_get( $comment_id, 'comment' );

		if ( ! $_comment ) {
			$_comment = $wpdb->get_row( $wpdb->prepare( "SELECT * FROM $wpdb->comments WHERE comment_ID = %d LIMIT 1", $comment_id ) );

			if ( ! $_comment ) {
				return false;
			}

			wp_cache_add( $_comment->comment_ID, $_comment, 'comment' );
		}

		return new WP_Comment( $_comment );
	}

	/**
	 * Constructor.
	 *
	 * Populates properties with object vars.
	 *
	 * @since 4.4.0
	 *
	 * @param WP_Comment $comment Comment object.
	 */
	public function __construct( $comment ) {
		foreach ( get_object_vars( $comment ) as $key => $value ) {
			$this->$key = $value;
		}
	}

	/**
	 * Convert object to array.
	 *
	 * @since 4.4.0
	 *
	 * @return array Object as array.
	 */
	public function to_array() {
		return get_object_vars( $this );
	}

	/**
	 * Get the children of a comment.
	 *
	 * @since 4.4.0
	 *
	 * @param array $args {
	 *     Array of arguments used to pass to get_comments() and determine format.
	 *
	 *     @type string $format        Return value format. 'tree' for a hierarchical tree, 'flat' for a flattened array.
	 *                                 Default 'tree'.
	 *     @type string $status        Comment status to limit results by. Accepts 'hold' (`comment_status=0`),
	 *                                 'approve' (`comment_status=1`), 'all', or a custom comment status.
	 *                                 Default 'all'.
	 *     @type string $hierarchical  Whether to include comment descendants in the results.
	 *                                 'threaded' returns a tree, with each comment's children
	 *                                 stored in a `children` property on the `WP_Comment` object.
	 *                                 'flat' returns a flat array of found comments plus their children.
	 *                                 Pass `false` to leave out descendants.
	 *                                 The parameter is ignored (forced to `false`) when `$fields` is 'ids' or 'counts'.
	 *                                 Accepts 'threaded', 'flat', or false. Default: 'threaded'.
	 *     @type string|array $orderby Comment status or array of statuses. To use 'meta_value'
	 *                                 or 'meta_value_num', `$meta_key` must also be defined.
	 *                                 To sort by a specific `$meta_query` clause, use that
	 *                                 clause's array key. Accepts 'comment_agent',
	 *                                 'comment_approved', 'comment_author',
	 *                                 'comment_author_email', 'comment_author_IP',
	 *                                 'comment_author_url', 'comment_content', 'comment_date',
	 *                                 'comment_date_gmt', 'comment_ID', 'comment_karma',
	 *                                 'comment_parent', 'comment_post_ID', 'comment_type',
	 *                                 'user_id', 'comment__in', 'meta_value', 'meta_value_num',
	 *                                 the value of $meta_key, and the array keys of
	 *                                 `$meta_query`. Also accepts false, an empty array, or
	 *                                 'none' to disable `ORDER BY` clause.
	 * }
	 * @return WP_Comment[] Array of `WP_Comment` objects.
	 */
	public function get_children( $args = array() ) {
		$defaults = array(
			'format'       => 'tree',
			'status'       => 'all',
			'hierarchical' => 'threaded',
			'orderby'      => '',
		);

		$_args           = wp_parse_args( $args, $defaults );
		$_args['parent'] = $this->comment_ID;

		if ( is_null( $this->children ) ) {
			if ( $this->populated_children ) {
				$this->children = array();
			} else {
				$this->children = get_comments( $_args );
			}
		}

		if ( 'flat' === $_args['format'] ) {
			$children = array();
			foreach ( $this->children as $child ) {
				$child_args           = $_args;
				$child_args['format'] = 'flat';
				// get_children() resets this value automatically.
				unset( $child_args['parent'] );

				$children = array_merge( $children, array( $child ), $child->get_children( $child_args ) );
			}
		} else {
			$children = $this->children;
		}

		return $children;
	}

	/**
	 * Add a child to the comment.
	 *
	 * Used by `WP_Comment_Query` when bulk-filling descendants.
	 *
	 * @since 4.4.0
	 *
	 * @param WP_Comment $child Child comment.
	 */
	public function add_child( WP_Comment $child ) {
		$this->children[ $child->comment_ID ] = $child;
	}

	/**
	 * Get a child comment by ID.
	 *
	 * @since 4.4.0
	 *
	 * @param int $child_id ID of the child.
	 * @return WP_Comment|false Returns the comment object if found, otherwise false.
	 */
	public function get_child( $child_id ) {
		if ( isset( $this->children[ $child_id ] ) ) {
			return $this->children[ $child_id ];
		}

		return false;
	}

	/**
	 * Set the 'populated_children' flag.
	 *
	 * This flag is important for ensuring that calling `get_children()` on a childless comment will not trigger
	 * unneeded database queries.
	 *
	 * @since 4.4.0
	 *
	 * @param bool $set Whether the comment's children have already been populated.
	 */
	public function populated_children( $set ) {
		$this->populated_children = (bool) $set;
	}

	/**
	 * Check whether a non-public property is set.
	 *
	 * If `$name` matches a post field, the comment post will be loaded and the post's value checked.
	 *
	 * @since 4.4.0
	 *
	 * @param string $name Property name.
	 * @return bool
	 */
	public function __isset( $name ) {
		if ( in_array( $name, $this->post_fields, true ) && 0 !== (int) $this->comment_post_ID ) {
			$post = get_post( $this->comment_post_ID );
			return property_exists( $post, $name );
		}
	}

	/**
	 * Magic getter.
	 *
	 * If `$name` matches a post field, the comment post will be loaded and the post's value returned.
	 *
	 * @since 4.4.0
	 *
	 * @param string $name
	 * @return mixed
	 */
	public function __get( $name ) {
		if ( in_array( $name, $this->post_fields, true ) ) {
			$post = get_post( $this->comment_post_ID );
			return $post->$name;
		}
	}
}

```


## WP_Post

```php
final class WP_Post {

	/**
	 * Post ID.
	 *
	 * @since 3.5.0
	 * @var int
	 */
	public $ID;

	/**
	 * ID of post author.
	 *
	 * A numeric string, for compatibility reasons.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $post_author = 0;

	/**
	 * The post's local publication time.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $post_date = '0000-00-00 00:00:00';

	/**
	 * The post's GMT publication time.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $post_date_gmt = '0000-00-00 00:00:00';

	/**
	 * The post's content.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $post_content = '';

	/**
	 * The post's title.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $post_title = '';

	/**
	 * The post's excerpt.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $post_excerpt = '';

	/**
	 * The post's status.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $post_status = 'publish';

	/**
	 * Whether comments are allowed.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $comment_status = 'open';

	/**
	 * Whether pings are allowed.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $ping_status = 'open';

	/**
	 * The post's password in plain text.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $post_password = '';

	/**
	 * The post's slug.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $post_name = '';

	/**
	 * URLs queued to be pinged.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $to_ping = '';

	/**
	 * URLs that have been pinged.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $pinged = '';

	/**
	 * The post's local modified time.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $post_modified = '0000-00-00 00:00:00';

	/**
	 * The post's GMT modified time.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $post_modified_gmt = '0000-00-00 00:00:00';

	/**
	 * A utility DB field for post content.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $post_content_filtered = '';

	/**
	 * ID of a post's parent post.
	 *
	 * @since 3.5.0
	 * @var int
	 */
	public $post_parent = 0;

	/**
	 * The unique identifier for a post, not necessarily a URL, used as the feed GUID.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $guid = '';

	/**
	 * A field used for ordering posts.
	 *
	 * @since 3.5.0
	 * @var int
	 */
	public $menu_order = 0;

	/**
	 * The post's type, like post or page.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $post_type = 'post';

	/**
	 * An attachment's mime type.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $post_mime_type = '';

	/**
	 * Cached comment count.
	 *
	 * A numeric string, for compatibility reasons.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $comment_count = 0;

	/**
	 * Stores the post object's sanitization level.
	 *
	 * Does not correspond to a DB field.
	 *
	 * @since 3.5.0
	 * @var string
	 */
	public $filter;

	/**
	 * Retrieve WP_Post instance.
	 *
	 * @since 3.5.0
	 *
	 * @global wpdb $wpdb WordPress database abstraction object.
	 *
	 * @param int $post_id Post ID.
	 * @return WP_Post|false Post object, false otherwise.
	 */
	public static function get_instance( $post_id ) {
		global $wpdb;

		$post_id = (int) $post_id;
		if ( ! $post_id ) {
			return false;
		}

		$_post = wp_cache_get( $post_id, 'posts' );

		if ( ! $_post ) {
			$_post = $wpdb->get_row( $wpdb->prepare( "SELECT * FROM $wpdb->posts WHERE ID = %d LIMIT 1", $post_id ) );

			if ( ! $_post ) {
				return false;
			}

			$_post = sanitize_post( $_post, 'raw' );
			wp_cache_add( $_post->ID, $_post, 'posts' );
		} elseif ( empty( $_post->filter ) || 'raw' !== $_post->filter ) {
			$_post = sanitize_post( $_post, 'raw' );
		}

		return new WP_Post( $_post );
	}

	/**
	 * Constructor.
	 *
	 * @since 3.5.0
	 *
	 * @param WP_Post|object $post Post object.
	 */
	public function __construct( $post ) {
		foreach ( get_object_vars( $post ) as $key => $value ) {
			$this->$key = $value;
		}
	}

	/**
	 * Isset-er.
	 *
	 * @since 3.5.0
	 *
	 * @param string $key Property to check if set.
	 * @return bool
	 */
	public function __isset( $key ) {
		if ( 'ancestors' === $key ) {
			return true;
		}

		if ( 'page_template' === $key ) {
			return true;
		}

		if ( 'post_category' === $key ) {
			return true;
		}

		if ( 'tags_input' === $key ) {
			return true;
		}

		return metadata_exists( 'post', $this->ID, $key );
	}

	/**
	 * Getter.
	 *
	 * @since 3.5.0
	 *
	 * @param string $key Key to get.
	 * @return mixed
	 */
	public function __get( $key ) {
		if ( 'page_template' === $key && $this->__isset( $key ) ) {
			return get_post_meta( $this->ID, '_wp_page_template', true );
		}

		if ( 'post_category' === $key ) {
			if ( is_object_in_taxonomy( $this->post_type, 'category' ) ) {
				$terms = get_the_terms( $this, 'category' );
			}

			if ( empty( $terms ) ) {
				return array();
			}

			return wp_list_pluck( $terms, 'term_id' );
		}

		if ( 'tags_input' === $key ) {
			if ( is_object_in_taxonomy( $this->post_type, 'post_tag' ) ) {
				$terms = get_the_terms( $this, 'post_tag' );
			}

			if ( empty( $terms ) ) {
				return array();
			}

			return wp_list_pluck( $terms, 'name' );
		}

		// Rest of the values need filtering.
		if ( 'ancestors' === $key ) {
			$value = get_post_ancestors( $this );
		} else {
			$value = get_post_meta( $this->ID, $key, true );
		}

		if ( $this->filter ) {
			$value = sanitize_post_field( $key, $value, $this->ID, $this->filter );
		}

		return $value;
	}

	/**
	 * {@Missing Summary}
	 *
	 * @since 3.5.0
	 *
	 * @param string $filter Filter.
	 * @return WP_Post
	 */
	public function filter( $filter ) {
		if ( $this->filter === $filter ) {
			return $this;
		}

		if ( 'raw' === $filter ) {
			return self::get_instance( $this->ID );
		}

		return sanitize_post( $this, $filter );
	}

	/**
	 * Convert object to array.
	 *
	 * @since 3.5.0
	 *
	 * @return array Object as array.
	 */
	public function to_array() {
		$post = get_object_vars( $this );

		foreach ( array( 'ancestors', 'page_template', 'post_category', 'tags_input' ) as $key ) {
			if ( $this->__isset( $key ) ) {
				$post[ $key ] = $this->__get( $key );
			}
		}

		return $post;
	}
}

```

## WP_Role
```php
class WP_Role {
	/**
	 * Role name.
	 *
	 * @since 2.0.0
	 * @var string
	 */
	public $name;

	/**
	 * List of capabilities the role contains.
	 *
	 * @since 2.0.0
	 * @var bool[] Array of key/value pairs where keys represent a capability name and boolean values
	 *             represent whether the role has that capability.
	 */
	public $capabilities;

	/**
	 * Constructor - Set up object properties.
	 *
	 * The list of capabilities must have the key as the name of the capability
	 * and the value a boolean of whether it is granted to the role.
	 *
	 * @since 2.0.0
	 *
	 * @param string $role         Role name.
	 * @param bool[] $capabilities Array of key/value pairs where keys represent a capability name and boolean values
	 *                             represent whether the role has that capability.
	 */
	public function __construct( $role, $capabilities ) {
		$this->name         = $role;
		$this->capabilities = $capabilities;
	}

	/**
	 * Assign role a capability.
	 *
	 * @since 2.0.0
	 *
	 * @param string $cap   Capability name.
	 * @param bool   $grant Whether role has capability privilege.
	 */
	public function add_cap( $cap, $grant = true ) {
		$this->capabilities[ $cap ] = $grant;
		wp_roles()->add_cap( $this->name, $cap, $grant );
	}

	/**
	 * Removes a capability from a role.
	 *
	 * @since 2.0.0
	 *
	 * @param string $cap Capability name.
	 */
	public function remove_cap( $cap ) {
		unset( $this->capabilities[ $cap ] );
		wp_roles()->remove_cap( $this->name, $cap );
	}

	/**
	 * Determines whether the role has the given capability.
	 *
	 * @since 2.0.0
	 *
	 * @param string $cap Capability name.
	 * @return bool Whether the role has the given capability.
	 */
	public function has_cap( $cap ) {
		/**
		 * Filters which capabilities a role has.
		 *
		 * @since 2.0.0
		 *
		 * @param bool[] $capabilities Array of key/value pairs where keys represent a capability name and boolean values
		 *                             represent whether the role has that capability.
		 * @param string $cap          Capability name.
		 * @param string $name         Role name.
		 */
		$capabilities = apply_filters( 'role_has_cap', $this->capabilities, $cap, $this->name );

		if ( ! empty( $capabilities[ $cap ] ) ) {
			return $capabilities[ $cap ];
		} else {
			return false;
		}
	}

}

```

## WP_Taxonomy

```php
final class WP_Taxonomy {
	/**
	 * Taxonomy key.
	 *
	 * @since 4.7.0
	 * @var string
	 */
	public $name;

	/**
	 * Name of the taxonomy shown in the menu. Usually plural.
	 *
	 * @since 4.7.0
	 * @var string
	 */
	public $label;

	/**
	 * Labels object for this taxonomy.
	 *
	 * If not set, tag labels are inherited for non-hierarchical types
	 * and category labels for hierarchical ones.
	 *
	 * @see get_taxonomy_labels()
	 *
	 * @since 4.7.0
	 * @var stdClass
	 */
	public $labels;

	/**
	 * Default labels.
	 *
	 * @since 6.0.0
	 * @var (string|null)[][] $default_labels
	 */
	protected static $default_labels = array();

	/**
	 * A short descriptive summary of what the taxonomy is for.
	 *
	 * @since 4.7.0
	 * @var string
	 */
	public $description = '';

	/**
	 * Whether a taxonomy is intended for use publicly either via the admin interface or by front-end users.
	 *
	 * @since 4.7.0
	 * @var bool
	 */
	public $public = true;

	/**
	 * Whether the taxonomy is publicly queryable.
	 *
	 * @since 4.7.0
	 * @var bool
	 */
	public $publicly_queryable = true;

	/**
	 * Whether the taxonomy is hierarchical.
	 *
	 * @since 4.7.0
	 * @var bool
	 */
	public $hierarchical = false;

	/**
	 * Whether to generate and allow a UI for managing terms in this taxonomy in the admin.
	 *
	 * @since 4.7.0
	 * @var bool
	 */
	public $show_ui = true;

	/**
	 * Whether to show the taxonomy in the admin menu.
	 *
	 * If true, the taxonomy is shown as a submenu of the object type menu. If false, no menu is shown.
	 *
	 * @since 4.7.0
	 * @var bool
	 */
	public $show_in_menu = true;

	/**
	 * Whether the taxonomy is available for selection in navigation menus.
	 *
	 * @since 4.7.0
	 * @var bool
	 */
	public $show_in_nav_menus = true;

	/**
	 * Whether to list the taxonomy in the tag cloud widget controls.
	 *
	 * @since 4.7.0
	 * @var bool
	 */
	public $show_tagcloud = true;

	/**
	 * Whether to show the taxonomy in the quick/bulk edit panel.
	 *
	 * @since 4.7.0
	 * @var bool
	 */
	public $show_in_quick_edit = true;

	/**
	 * Whether to display a column for the taxonomy on its post type listing screens.
	 *
	 * @since 4.7.0
	 * @var bool
	 */
	public $show_admin_column = false;

	/**
	 * The callback function for the meta box display.
	 *
	 * @since 4.7.0
	 * @var bool|callable
	 */
	public $meta_box_cb = null;

	/**
	 * The callback function for sanitizing taxonomy data saved from a meta box.
	 *
	 * @since 5.1.0
	 * @var callable
	 */
	public $meta_box_sanitize_cb = null;

	/**
	 * An array of object types this taxonomy is registered for.
	 *
	 * @since 4.7.0
	 * @var string[]
	 */
	public $object_type = null;

	/**
	 * Capabilities for this taxonomy.
	 *
	 * @since 4.7.0
	 * @var stdClass
	 */
	public $cap;

	/**
	 * Rewrites information for this taxonomy.
	 *
	 * @since 4.7.0
	 * @var array|false
	 */
	public $rewrite;

	/**
	 * Query var string for this taxonomy.
	 *
	 * @since 4.7.0
	 * @var string|false
	 */
	public $query_var;

	/**
	 * Function that will be called when the count is updated.
	 *
	 * @since 4.7.0
	 * @var callable
	 */
	public $update_count_callback;

	/**
	 * Whether this taxonomy should appear in the REST API.
	 *
	 * Default false. If true, standard endpoints will be registered with
	 * respect to $rest_base and $rest_controller_class.
	 *
	 * @since 4.7.4
	 * @var bool $show_in_rest
	 */
	public $show_in_rest;

	/**
	 * The base path for this taxonomy's REST API endpoints.
	 *
	 * @since 4.7.4
	 * @var string|bool $rest_base
	 */
	public $rest_base;

	/**
	 * The namespace for this taxonomy's REST API endpoints.
	 *
	 * @since 5.9.0
	 * @var string|bool $rest_namespace
	 */
	public $rest_namespace;

	/**
	 * The controller for this taxonomy's REST API endpoints.
	 *
	 * Custom controllers must extend WP_REST_Controller.
	 *
	 * @since 4.7.4
	 * @var string|bool $rest_controller_class
	 */
	public $rest_controller_class;

	/**
	 * The controller instance for this taxonomy's REST API endpoints.
	 *
	 * Lazily computed. Should be accessed using {@see WP_Taxonomy::get_rest_controller()}.
	 *
	 * @since 5.5.0
	 * @var WP_REST_Controller $rest_controller
	 */
	public $rest_controller;

	/**
	 * The default term name for this taxonomy. If you pass an array you have
	 * to set 'name' and optionally 'slug' and 'description'.
	 *
	 * @since 5.5.0
	 * @var array|string
	 */
	public $default_term;

	/**
	 * Whether terms in this taxonomy should be sorted in the order they are provided to `wp_set_object_terms()`.
	 *
	 * Use this in combination with `'orderby' => 'term_order'` when fetching terms.
	 *
	 * @since 2.5.0
	 * @var bool|null
	 */
	public $sort = null;

	/**
	 * Array of arguments to automatically use inside `wp_get_object_terms()` for this taxonomy.
	 *
	 * @since 2.6.0
	 * @var array|null
	 */
	public $args = null;

	/**
	 * Whether it is a built-in taxonomy.
	 *
	 * @since 4.7.0
	 * @var bool
	 */
	public $_builtin;

	/**
	 * Constructor.
	 *
	 * See the register_taxonomy() function for accepted arguments for `$args`.
	 *
	 * @since 4.7.0
	 *
	 * @global WP $wp Current WordPress environment instance.
	 *
	 * @param string       $taxonomy    Taxonomy key, must not exceed 32 characters.
	 * @param array|string $object_type Name of the object type for the taxonomy object.
	 * @param array|string $args        Optional. Array or query string of arguments for registering a taxonomy.
	 *                                  Default empty array.
	 */
	public function __construct( $taxonomy, $object_type, $args = array() ) {
		$this->name = $taxonomy;

		$this->set_props( $object_type, $args );
	}

	/**
	 * Sets taxonomy properties.
	 *
	 * See the register_taxonomy() function for accepted arguments for `$args`.
	 *
	 * @since 4.7.0
	 *
	 * @param string|string[] $object_type Name or array of names of the object types for the taxonomy.
	 * @param array|string    $args        Array or query string of arguments for registering a taxonomy.
	 */
	public function set_props( $object_type, $args ) {
		$args = wp_parse_args( $args );

		/**
		 * Filters the arguments for registering a taxonomy.
		 *
		 * @since 4.4.0
		 *
		 * @param array    $args        Array of arguments for registering a taxonomy.
		 *                              See the register_taxonomy() function for accepted arguments.
		 * @param string   $taxonomy    Taxonomy key.
		 * @param string[] $object_type Array of names of object types for the taxonomy.
		 */
		$args = apply_filters( 'register_taxonomy_args', $args, $this->name, (array) $object_type );

		$taxonomy = $this->name;

		/**
		 * Filters the arguments for registering a specific taxonomy.
		 *
		 * The dynamic portion of the filter name, `$taxonomy`, refers to the taxonomy key.
		 *
		 * Possible hook names include:
		 *
		 *  - `register_category_taxonomy_args`
		 *  - `register_post_tag_taxonomy_args`
		 *
		 * @since 6.0.0
		 *
		 * @param array    $args        Array of arguments for registering a taxonomy.
		 *                              See the register_taxonomy() function for accepted arguments.
		 * @param string   $taxonomy    Taxonomy key.
		 * @param string[] $object_type Array of names of object types for the taxonomy.
		 */
		$args = apply_filters( "register_{$taxonomy}_taxonomy_args", $args, $this->name, (array) $object_type );

		$defaults = array(
			'labels'                => array(),
			'description'           => '',
			'public'                => true,
			'publicly_queryable'    => null,
			'hierarchical'          => false,
			'show_ui'               => null,
			'show_in_menu'          => null,
			'show_in_nav_menus'     => null,
			'show_tagcloud'         => null,
			'show_in_quick_edit'    => null,
			'show_admin_column'     => false,
			'meta_box_cb'           => null,
			'meta_box_sanitize_cb'  => null,
			'capabilities'          => array(),
			'rewrite'               => true,
			'query_var'             => $this->name,
			'update_count_callback' => '',
			'show_in_rest'          => false,
			'rest_base'             => false,
			'rest_namespace'        => false,
			'rest_controller_class' => false,
			'default_term'          => null,
			'sort'                  => null,
			'args'                  => null,
			'_builtin'              => false,
		);

		$args = array_merge( $defaults, $args );

		// If not set, default to the setting for 'public'.
		if ( null === $args['publicly_queryable'] ) {
			$args['publicly_queryable'] = $args['public'];
		}

		if ( false !== $args['query_var'] && ( is_admin() || false !== $args['publicly_queryable'] ) ) {
			if ( true === $args['query_var'] ) {
				$args['query_var'] = $this->name;
			} else {
				$args['query_var'] = sanitize_title_with_dashes( $args['query_var'] );
			}
		} else {
			// Force 'query_var' to false for non-public taxonomies.
			$args['query_var'] = false;
		}

		if ( false !== $args['rewrite'] && ( is_admin() || get_option( 'permalink_structure' ) ) ) {
			$args['rewrite'] = wp_parse_args(
				$args['rewrite'],
				array(
					'with_front'   => true,
					'hierarchical' => false,
					'ep_mask'      => EP_NONE,
				)
			);

			if ( empty( $args['rewrite']['slug'] ) ) {
				$args['rewrite']['slug'] = sanitize_title_with_dashes( $this->name );
			}
		}

		// If not set, default to the setting for 'public'.
		if ( null === $args['show_ui'] ) {
			$args['show_ui'] = $args['public'];
		}

		// If not set, default to the setting for 'show_ui'.
		if ( null === $args['show_in_menu'] || ! $args['show_ui'] ) {
			$args['show_in_menu'] = $args['show_ui'];
		}

		// If not set, default to the setting for 'public'.
		if ( null === $args['show_in_nav_menus'] ) {
			$args['show_in_nav_menus'] = $args['public'];
		}

		// If not set, default to the setting for 'show_ui'.
		if ( null === $args['show_tagcloud'] ) {
			$args['show_tagcloud'] = $args['show_ui'];
		}

		// If not set, default to the setting for 'show_ui'.
		if ( null === $args['show_in_quick_edit'] ) {
			$args['show_in_quick_edit'] = $args['show_ui'];
		}

		// If not set, default rest_namespace to wp/v2 if show_in_rest is true.
		if ( false === $args['rest_namespace'] && ! empty( $args['show_in_rest'] ) ) {
			$args['rest_namespace'] = 'wp/v2';
		}

		$default_caps = array(
			'manage_terms' => 'manage_categories',
			'edit_terms'   => 'manage_categories',
			'delete_terms' => 'manage_categories',
			'assign_terms' => 'edit_posts',
		);

		$args['cap'] = (object) array_merge( $default_caps, $args['capabilities'] );
		unset( $args['capabilities'] );

		$args['object_type'] = array_unique( (array) $object_type );

		// If not set, use the default meta box.
		if ( null === $args['meta_box_cb'] ) {
			if ( $args['hierarchical'] ) {
				$args['meta_box_cb'] = 'post_categories_meta_box';
			} else {
				$args['meta_box_cb'] = 'post_tags_meta_box';
			}
		}

		$args['name'] = $this->name;

		// Default meta box sanitization callback depends on the value of 'meta_box_cb'.
		if ( null === $args['meta_box_sanitize_cb'] ) {
			switch ( $args['meta_box_cb'] ) {
				case 'post_categories_meta_box':
					$args['meta_box_sanitize_cb'] = 'taxonomy_meta_box_sanitize_cb_checkboxes';
					break;

				case 'post_tags_meta_box':
				default:
					$args['meta_box_sanitize_cb'] = 'taxonomy_meta_box_sanitize_cb_input';
					break;
			}
		}

		// Default taxonomy term.
		if ( ! empty( $args['default_term'] ) ) {
			if ( ! is_array( $args['default_term'] ) ) {
				$args['default_term'] = array( 'name' => $args['default_term'] );
			}
			$args['default_term'] = wp_parse_args(
				$args['default_term'],
				array(
					'name'        => '',
					'slug'        => '',
					'description' => '',
				)
			);
		}

		foreach ( $args as $property_name => $property_value ) {
			$this->$property_name = $property_value;
		}

		$this->labels = get_taxonomy_labels( $this );
		$this->label  = $this->labels->name;
	}

	/**
	 * Adds the necessary rewrite rules for the taxonomy.
	 *
	 * @since 4.7.0
	 *
	 * @global WP $wp Current WordPress environment instance.
	 */
	public function add_rewrite_rules() {
		/* @var WP $wp */
		global $wp;

		// Non-publicly queryable taxonomies should not register query vars, except in the admin.
		if ( false !== $this->query_var && $wp ) {
			$wp->add_query_var( $this->query_var );
		}

		if ( false !== $this->rewrite && ( is_admin() || get_option( 'permalink_structure' ) ) ) {
			if ( $this->hierarchical && $this->rewrite['hierarchical'] ) {
				$tag = '(.+?)';
			} else {
				$tag = '([^/]+)';
			}

			add_rewrite_tag( "%$this->name%", $tag, $this->query_var ? "{$this->query_var}=" : "taxonomy=$this->name&term=" );
			add_permastruct( $this->name, "{$this->rewrite['slug']}/%$this->name%", $this->rewrite );
		}
	}

	/**
	 * Removes any rewrite rules, permastructs, and rules for the taxonomy.
	 *
	 * @since 4.7.0
	 *
	 * @global WP $wp Current WordPress environment instance.
	 */
	public function remove_rewrite_rules() {
		/* @var WP $wp */
		global $wp;

		// Remove query var.
		if ( false !== $this->query_var ) {
			$wp->remove_query_var( $this->query_var );
		}

		// Remove rewrite tags and permastructs.
		if ( false !== $this->rewrite ) {
			remove_rewrite_tag( "%$this->name%" );
			remove_permastruct( $this->name );
		}
	}

	/**
	 * Registers the ajax callback for the meta box.
	 *
	 * @since 4.7.0
	 */
	public function add_hooks() {
		add_filter( 'wp_ajax_add-' . $this->name, '_wp_ajax_add_hierarchical_term' );
	}

	/**
	 * Removes the ajax callback for the meta box.
	 *
	 * @since 4.7.0
	 */
	public function remove_hooks() {
		remove_filter( 'wp_ajax_add-' . $this->name, '_wp_ajax_add_hierarchical_term' );
	}

	/**
	 * Gets the REST API controller for this taxonomy.
	 *
	 * Will only instantiate the controller class once per request.
	 *
	 * @since 5.5.0
	 *
	 * @return WP_REST_Controller|null The controller instance, or null if the taxonomy
	 *                                 is set not to show in rest.
	 */
	public function get_rest_controller() {
		if ( ! $this->show_in_rest ) {
			return null;
		}

		$class = $this->rest_controller_class ? $this->rest_controller_class : WP_REST_Terms_Controller::class;

		if ( ! class_exists( $class ) ) {
			return null;
		}

		if ( ! is_subclass_of( $class, WP_REST_Controller::class ) ) {
			return null;
		}

		if ( ! $this->rest_controller ) {
			$this->rest_controller = new $class( $this->name );
		}

		if ( ! ( $this->rest_controller instanceof $class ) ) {
			return null;
		}

		return $this->rest_controller;
	}

	/**
	 * Returns the default labels for taxonomies.
	 *
	 * @since 6.0.0
	 *
	 * @return (string|null)[][] The default labels for taxonomies.
	 */
	public static function get_default_labels() {
		if ( ! empty( self::$default_labels ) ) {
			return self::$default_labels;
		}

		$name_field_description   = __( 'The name is how it appears on your site.' );
		$slug_field_description   = __( 'The &#8220;slug&#8221; is the URL-friendly version of the name. It is usually all lowercase and contains only letters, numbers, and hyphens.' );
		$parent_field_description = __( 'Assign a parent term to create a hierarchy. The term Jazz, for example, would be the parent of Bebop and Big Band.' );
		$desc_field_description   = __( 'The description is not prominent by default; however, some themes may show it.' );

		self::$default_labels = array(
			'name'                       => array( _x( 'Tags', 'taxonomy general name' ), _x( 'Categories', 'taxonomy general name' ) ),
			'singular_name'              => array( _x( 'Tag', 'taxonomy singular name' ), _x( 'Category', 'taxonomy singular name' ) ),
			'search_items'               => array( __( 'Search Tags' ), __( 'Search Categories' ) ),
			'popular_items'              => array( __( 'Popular Tags' ), null ),
			'all_items'                  => array( __( 'All Tags' ), __( 'All Categories' ) ),
			'parent_item'                => array( null, __( 'Parent Category' ) ),
			'parent_item_colon'          => array( null, __( 'Parent Category:' ) ),
			'name_field_description'     => array( $name_field_description, $name_field_description ),
			'slug_field_description'     => array( $slug_field_description, $slug_field_description ),
			'parent_field_description'   => array( null, $parent_field_description ),
			'desc_field_description'     => array( $desc_field_description, $desc_field_description ),
			'edit_item'                  => array( __( 'Edit Tag' ), __( 'Edit Category' ) ),
			'view_item'                  => array( __( 'View Tag' ), __( 'View Category' ) ),
			'update_item'                => array( __( 'Update Tag' ), __( 'Update Category' ) ),
			'add_new_item'               => array( __( 'Add New Tag' ), __( 'Add New Category' ) ),
			'new_item_name'              => array( __( 'New Tag Name' ), __( 'New Category Name' ) ),
			'separate_items_with_commas' => array( __( 'Separate tags with commas' ), null ),
			'add_or_remove_items'        => array( __( 'Add or remove tags' ), null ),
			'choose_from_most_used'      => array( __( 'Choose from the most used tags' ), null ),
			'not_found'                  => array( __( 'No tags found.' ), __( 'No categories found.' ) ),
			'no_terms'                   => array( __( 'No tags' ), __( 'No categories' ) ),
			'filter_by_item'             => array( null, __( 'Filter by category' ) ),
			'items_list_navigation'      => array( __( 'Tags list navigation' ), __( 'Categories list navigation' ) ),
			'items_list'                 => array( __( 'Tags list' ), __( 'Categories list' ) ),
			/* translators: Tab heading when selecting from the most used terms. */
			'most_used'                  => array( _x( 'Most Used', 'tags' ), _x( 'Most Used', 'categories' ) ),
			'back_to_items'              => array( __( '&larr; Go to Tags' ), __( '&larr; Go to Categories' ) ),
			'item_link'                  => array(
				_x( 'Tag Link', 'navigation link block title' ),
				_x( 'Category Link', 'navigation link block title' ),
			),
			'item_link_description'      => array(
				_x( 'A link to a tag.', 'navigation link block description' ),
				_x( 'A link to a category.', 'navigation link block description' ),
			),
		);

		return self::$default_labels;
	}

	/**
	 * Resets the cache for the default labels.
	 *
	 * @since 6.0.0
	 */
	public static function reset_default_labels() {
		self::$default_labels = array();
	}
}

```

## WP_Term
```php
final class WP_Term {

	/**
	 * Term ID.
	 *
	 * @since 4.4.0
	 * @var int
	 */
	public $term_id;

	/**
	 * The term's name.
	 *
	 * @since 4.4.0
	 * @var string
	 */
	public $name = '';

	/**
	 * The term's slug.
	 *
	 * @since 4.4.0
	 * @var string
	 */
	public $slug = '';

	/**
	 * The term's term_group.
	 *
	 * @since 4.4.0
	 * @var int
	 */
	public $term_group = '';

	/**
	 * Term Taxonomy ID.
	 *
	 * @since 4.4.0
	 * @var int
	 */
	public $term_taxonomy_id = 0;

	/**
	 * The term's taxonomy name.
	 *
	 * @since 4.4.0
	 * @var string
	 */
	public $taxonomy = '';

	/**
	 * The term's description.
	 *
	 * @since 4.4.0
	 * @var string
	 */
	public $description = '';

	/**
	 * ID of a term's parent term.
	 *
	 * @since 4.4.0
	 * @var int
	 */
	public $parent = 0;

	/**
	 * Cached object count for this term.
	 *
	 * @since 4.4.0
	 * @var int
	 */
	public $count = 0;

	/**
	 * Stores the term object's sanitization level.
	 *
	 * Does not correspond to a database field.
	 *
	 * @since 4.4.0
	 * @var string
	 */
	public $filter = 'raw';

	/**
	 * Retrieve WP_Term instance.
	 *
	 * @since 4.4.0
	 *
	 * @global wpdb $wpdb WordPress database abstraction object.
	 *
	 * @param int    $term_id  Term ID.
	 * @param string $taxonomy Optional. Limit matched terms to those matching `$taxonomy`. Only used for
	 *                         disambiguating potentially shared terms.
	 * @return WP_Term|WP_Error|false Term object, if found. WP_Error if `$term_id` is shared between taxonomies and
	 *                                there's insufficient data to distinguish which term is intended.
	 *                                False for other failures.
	 */
	public static function get_instance( $term_id, $taxonomy = null ) {
		global $wpdb;

		$term_id = (int) $term_id;
		if ( ! $term_id ) {
			return false;
		}

		$_term = wp_cache_get( $term_id, 'terms' );

		// If there isn't a cached version, hit the database.
		if ( ! $_term || ( $taxonomy && $taxonomy !== $_term->taxonomy ) ) {
			// Any term found in the cache is not a match, so don't use it.
			$_term = false;

			// Grab all matching terms, in case any are shared between taxonomies.
			$terms = $wpdb->get_results( $wpdb->prepare( "SELECT t.*, tt.* FROM $wpdb->terms AS t INNER JOIN $wpdb->term_taxonomy AS tt ON t.term_id = tt.term_id WHERE t.term_id = %d", $term_id ) );
			if ( ! $terms ) {
				return false;
			}

			// If a taxonomy was specified, find a match.
			if ( $taxonomy ) {
				foreach ( $terms as $match ) {
					if ( $taxonomy === $match->taxonomy ) {
						$_term = $match;
						break;
					}
				}

				// If only one match was found, it's the one we want.
			} elseif ( 1 === count( $terms ) ) {
				$_term = reset( $terms );

				// Otherwise, the term must be shared between taxonomies.
			} else {
				// If the term is shared only with invalid taxonomies, return the one valid term.
				foreach ( $terms as $t ) {
					if ( ! taxonomy_exists( $t->taxonomy ) ) {
						continue;
					}

					// Only hit if we've already identified a term in a valid taxonomy.
					if ( $_term ) {
						return new WP_Error( 'ambiguous_term_id', __( 'Term ID is shared between multiple taxonomies' ), $term_id );
					}

					$_term = $t;
				}
			}

			if ( ! $_term ) {
				return false;
			}

			// Don't return terms from invalid taxonomies.
			if ( ! taxonomy_exists( $_term->taxonomy ) ) {
				return new WP_Error( 'invalid_taxonomy', __( 'Invalid taxonomy.' ) );
			}

			$_term = sanitize_term( $_term, $_term->taxonomy, 'raw' );

			// Don't cache terms that are shared between taxonomies.
			if ( 1 === count( $terms ) ) {
				wp_cache_add( $term_id, $_term, 'terms' );
			}
		}

		$term_obj = new WP_Term( $_term );
		$term_obj->filter( $term_obj->filter );

		return $term_obj;
	}

	/**
	 * Constructor.
	 *
	 * @since 4.4.0
	 *
	 * @param WP_Term|object $term Term object.
	 */
	public function __construct( $term ) {
		foreach ( get_object_vars( $term ) as $key => $value ) {
			$this->$key = $value;
		}
	}

	/**
	 * Sanitizes term fields, according to the filter type provided.
	 *
	 * @since 4.4.0
	 *
	 * @param string $filter Filter context. Accepts 'edit', 'db', 'display', 'attribute', 'js', 'rss', or 'raw'.
	 */
	public function filter( $filter ) {
		sanitize_term( $this, $this->taxonomy, $filter );
	}

	/**
	 * Converts an object to array.
	 *
	 * @since 4.4.0
	 *
	 * @return array Object as array.
	 */
	public function to_array() {
		return get_object_vars( $this );
	}

	/**
	 * Getter.
	 *
	 * @since 4.4.0
	 *
	 * @param string $key Property to get.
	 * @return mixed Property value.
	 */
	public function __get( $key ) {
		switch ( $key ) {
			case 'data':
				$data    = new stdClass();
				$columns = array( 'term_id', 'name', 'slug', 'term_group', 'term_taxonomy_id', 'taxonomy', 'description', 'parent', 'count' );
				foreach ( $columns as $column ) {
					$data->{$column} = isset( $this->{$column} ) ? $this->{$column} : null;
				}

				return sanitize_term( $data, $data->taxonomy, 'raw' );
		}
	}
}

```

## WP_User
```php
class WP_User {
	/**
	 * User data container.
	 *
	 * @since 2.0.0
	 * @var stdClass
	 */
	public $data;

	/**
	 * The user's ID.
	 *
	 * @since 2.1.0
	 * @var int
	 */
	public $ID = 0;

	/**
	 * Capabilities that the individual user has been granted outside of those inherited from their role.
	 *
	 * @since 2.0.0
	 * @var bool[] Array of key/value pairs where keys represent a capability name
	 *             and boolean values represent whether the user has that capability.
	 */
	public $caps = array();

	/**
	 * User metadata option name.
	 *
	 * @since 2.0.0
	 * @var string
	 */
	public $cap_key;

	/**
	 * The roles the user is part of.
	 *
	 * @since 2.0.0
	 * @var string[]
	 */
	public $roles = array();

	/**
	 * All capabilities the user has, including individual and role based.
	 *
	 * @since 2.0.0
	 * @var bool[] Array of key/value pairs where keys represent a capability name
	 *             and boolean values represent whether the user has that capability.
	 */
	public $allcaps = array();

	/**
	 * The filter context applied to user data fields.
	 *
	 * @since 2.9.0
	 * @var string
	 */
	public $filter = null;

	/**
	 * The site ID the capabilities of this user are initialized for.
	 *
	 * @since 4.9.0
	 * @var int
	 */
	private $site_id = 0;

	/**
	 * @since 3.3.0
	 * @var array
	 */
	private static $back_compat_keys;

	/**
	 * Constructor.
	 *
	 * Retrieves the userdata and passes it to WP_User::init().
	 *
	 * @since 2.0.0
	 *
	 * @param int|string|stdClass|WP_User $id      User's ID, a WP_User object, or a user object from the DB.
	 * @param string                      $name    Optional. User's username
	 * @param int                         $site_id Optional Site ID, defaults to current site.
	 */
	public function __construct( $id = 0, $name = '', $site_id = '' ) {
		if ( ! isset( self::$back_compat_keys ) ) {
			$prefix                 = $GLOBALS['wpdb']->prefix;
			self::$back_compat_keys = array(
				'user_firstname'             => 'first_name',
				'user_lastname'              => 'last_name',
				'user_description'           => 'description',
				'user_level'                 => $prefix . 'user_level',
				$prefix . 'usersettings'     => $prefix . 'user-settings',
				$prefix . 'usersettingstime' => $prefix . 'user-settings-time',
			);
		}

		if ( $id instanceof WP_User ) {
			$this->init( $id->data, $site_id );
			return;
		} elseif ( is_object( $id ) ) {
			$this->init( $id, $site_id );
			return;
		}

		if ( ! empty( $id ) && ! is_numeric( $id ) ) {
			$name = $id;
			$id   = 0;
		}

		if ( $id ) {
			$data = self::get_data_by( 'id', $id );
		} else {
			$data = self::get_data_by( 'login', $name );
		}

		if ( $data ) {
			$this->init( $data, $site_id );
		} else {
			$this->data = new stdClass;
		}
	}

	/**
	 * Sets up object properties, including capabilities.
	 *
	 * @since 3.3.0
	 *
	 * @param object $data    User DB row object.
	 * @param int    $site_id Optional. The site ID to initialize for.
	 */
	public function init( $data, $site_id = '' ) {
		if ( ! isset( $data->ID ) ) {
			$data->ID = 0;
		}
		$this->data = $data;
		$this->ID   = (int) $data->ID;

		$this->for_site( $site_id );
	}

	/**
	 * Returns only the main user fields.
	 *
	 * @since 3.3.0
	 * @since 4.4.0 Added 'ID' as an alias of 'id' for the `$field` parameter.
	 *
	 * @global wpdb $wpdb WordPress database abstraction object.
	 *
	 * @param string     $field The field to query against: 'id', 'ID', 'slug', 'email' or 'login'.
	 * @param string|int $value The field value.
	 * @return object|false Raw user object.
	 */
	public static function get_data_by( $field, $value ) {
		global $wpdb;

		// 'ID' is an alias of 'id'.
		if ( 'ID' === $field ) {
			$field = 'id';
		}

		if ( 'id' === $field ) {
			// Make sure the value is numeric to avoid casting objects, for example,
			// to int 1.
			if ( ! is_numeric( $value ) ) {
				return false;
			}
			$value = (int) $value;
			if ( $value < 1 ) {
				return false;
			}
		} else {
			$value = trim( $value );
		}

		if ( ! $value ) {
			return false;
		}

		switch ( $field ) {
			case 'id':
				$user_id  = $value;
				$db_field = 'ID';
				break;
			case 'slug':
				$user_id  = wp_cache_get( $value, 'userslugs' );
				$db_field = 'user_nicename';
				break;
			case 'email':
				$user_id  = wp_cache_get( $value, 'useremail' );
				$db_field = 'user_email';
				break;
			case 'login':
				$value    = sanitize_user( $value );
				$user_id  = wp_cache_get( $value, 'userlogins' );
				$db_field = 'user_login';
				break;
			default:
				return false;
		}

		if ( false !== $user_id ) {
			$user = wp_cache_get( $user_id, 'users' );
			if ( $user ) {
				return $user;
			}
		}

		$user = $wpdb->get_row(
			$wpdb->prepare(
				"SELECT * FROM $wpdb->users WHERE $db_field = %s LIMIT 1",
				$value
			)
		);
		if ( ! $user ) {
			return false;
		}

		update_user_caches( $user );

		return $user;
	}

	/**
	 * Magic method for checking the existence of a certain custom field.
	 *
	 * @since 3.3.0
	 *
	 * @param string $key User meta key to check if set.
	 * @return bool Whether the given user meta key is set.
	 */
	public function __isset( $key ) {
		if ( 'id' === $key ) {
			_deprecated_argument(
				'WP_User->id',
				'2.1.0',
				sprintf(
					/* translators: %s: WP_User->ID */
					__( 'Use %s instead.' ),
					'<code>WP_User->ID</code>'
				)
			);
			$key = 'ID';
		}

		if ( isset( $this->data->$key ) ) {
			return true;
		}

		if ( isset( self::$back_compat_keys[ $key ] ) ) {
			$key = self::$back_compat_keys[ $key ];
		}

		return metadata_exists( 'user', $this->ID, $key );
	}

	/**
	 * Magic method for accessing custom fields.
	 *
	 * @since 3.3.0
	 *
	 * @param string $key User meta key to retrieve.
	 * @return mixed Value of the given user meta key (if set). If `$key` is 'id', the user ID.
	 */
	public function __get( $key ) {
		if ( 'id' === $key ) {
			_deprecated_argument(
				'WP_User->id',
				'2.1.0',
				sprintf(
					/* translators: %s: WP_User->ID */
					__( 'Use %s instead.' ),
					'<code>WP_User->ID</code>'
				)
			);
			return $this->ID;
		}

		if ( isset( $this->data->$key ) ) {
			$value = $this->data->$key;
		} else {
			if ( isset( self::$back_compat_keys[ $key ] ) ) {
				$key = self::$back_compat_keys[ $key ];
			}
			$value = get_user_meta( $this->ID, $key, true );
		}

		if ( $this->filter ) {
			$value = sanitize_user_field( $key, $value, $this->ID, $this->filter );
		}

		return $value;
	}

	/**
	 * Magic method for setting custom user fields.
	 *
	 * This method does not update custom fields in the database. It only stores
	 * the value on the WP_User instance.
	 *
	 * @since 3.3.0
	 *
	 * @param string $key   User meta key.
	 * @param mixed  $value User meta value.
	 */
	public function __set( $key, $value ) {
		if ( 'id' === $key ) {
			_deprecated_argument(
				'WP_User->id',
				'2.1.0',
				sprintf(
					/* translators: %s: WP_User->ID */
					__( 'Use %s instead.' ),
					'<code>WP_User->ID</code>'
				)
			);
			$this->ID = $value;
			return;
		}

		$this->data->$key = $value;
	}

	/**
	 * Magic method for unsetting a certain custom field.
	 *
	 * @since 4.4.0
	 *
	 * @param string $key User meta key to unset.
	 */
	public function __unset( $key ) {
		if ( 'id' === $key ) {
			_deprecated_argument(
				'WP_User->id',
				'2.1.0',
				sprintf(
					/* translators: %s: WP_User->ID */
					__( 'Use %s instead.' ),
					'<code>WP_User->ID</code>'
				)
			);
		}

		if ( isset( $this->data->$key ) ) {
			unset( $this->data->$key );
		}

		if ( isset( self::$back_compat_keys[ $key ] ) ) {
			unset( self::$back_compat_keys[ $key ] );
		}
	}

	/**
	 * Determines whether the user exists in the database.
	 *
	 * @since 3.4.0
	 *
	 * @return bool True if user exists in the database, false if not.
	 */
	public function exists() {
		return ! empty( $this->ID );
	}

	/**
	 * Retrieves the value of a property or meta key.
	 *
	 * Retrieves from the users and usermeta table.
	 *
	 * @since 3.3.0
	 *
	 * @param string $key Property
	 * @return mixed
	 */
	public function get( $key ) {
		return $this->__get( $key );
	}

	/**
	 * Determines whether a property or meta key is set.
	 *
	 * Consults the users and usermeta tables.
	 *
	 * @since 3.3.0
	 *
	 * @param string $key Property.
	 * @return bool
	 */
	public function has_prop( $key ) {
		return $this->__isset( $key );
	}

	/**
	 * Returns an array representation.
	 *
	 * @since 3.5.0
	 *
	 * @return array Array representation.
	 */
	public function to_array() {
		return get_object_vars( $this->data );
	}

	/**
	 * Makes private/protected methods readable for backward compatibility.
	 *
	 * @since 4.3.0
	 *
	 * @param string $name      Method to call.
	 * @param array  $arguments Arguments to pass when calling.
	 * @return mixed|false Return value of the callback, false otherwise.
	 */
	public function __call( $name, $arguments ) {
		if ( '_init_caps' === $name ) {
			return $this->_init_caps( ...$arguments );
		}
		return false;
	}

	/**
	 * Sets up capability object properties.
	 *
	 * Will set the value for the 'cap_key' property to current database table
	 * prefix, followed by 'capabilities'. Will then check to see if the
	 * property matching the 'cap_key' exists and is an array. If so, it will be
	 * used.
	 *
	 * @since 2.1.0
	 * @deprecated 4.9.0 Use WP_User::for_site()
	 *
	 * @global wpdb $wpdb WordPress database abstraction object.
	 *
	 * @param string $cap_key Optional capability key
	 */
	protected function _init_caps( $cap_key = '' ) {
		global $wpdb;

		_deprecated_function( __METHOD__, '4.9.0', 'WP_User::for_site()' );

		if ( empty( $cap_key ) ) {
			$this->cap_key = $wpdb->get_blog_prefix( $this->site_id ) . 'capabilities';
		} else {
			$this->cap_key = $cap_key;
		}

		$this->caps = $this->get_caps_data();

		$this->get_role_caps();
	}

	/**
	 * Retrieves all of the capabilities of the user's roles, and merges them with
	 * individual user capabilities.
	 *
	 * All of the capabilities of the user's roles are merged with the user's individual
	 * capabilities. This means that the user can be denied specific capabilities that
	 * their role might have, but the user is specifically denied.
	 *
	 * @since 2.0.0
	 *
	 * @return bool[] Array of key/value pairs where keys represent a capability name
	 *                and boolean values represent whether the user has that capability.
	 */
	public function get_role_caps() {
		$switch_site = false;
		if ( is_multisite() && get_current_blog_id() != $this->site_id ) {
			$switch_site = true;

			switch_to_blog( $this->site_id );
		}

		$wp_roles = wp_roles();

		// Filter out caps that are not role names and assign to $this->roles.
		if ( is_array( $this->caps ) ) {
			$this->roles = array_filter( array_keys( $this->caps ), array( $wp_roles, 'is_role' ) );
		}

		// Build $allcaps from role caps, overlay user's $caps.
		$this->allcaps = array();
		foreach ( (array) $this->roles as $role ) {
			$the_role      = $wp_roles->get_role( $role );
			$this->allcaps = array_merge( (array) $this->allcaps, (array) $the_role->capabilities );
		}
		$this->allcaps = array_merge( (array) $this->allcaps, (array) $this->caps );

		if ( $switch_site ) {
			restore_current_blog();
		}

		return $this->allcaps;
	}

	/**
	 * Adds role to user.
	 *
	 * Updates the user's meta data option with capabilities and roles.
	 *
	 * @since 2.0.0
	 *
	 * @param string $role Role name.
	 */
	public function add_role( $role ) {
		if ( empty( $role ) ) {
			return;
		}

		if ( in_array( $role, $this->roles, true ) ) {
			return;
		}

		$this->caps[ $role ] = true;
		update_user_meta( $this->ID, $this->cap_key, $this->caps );
		$this->get_role_caps();
		$this->update_user_level_from_caps();

		/**
		 * Fires immediately after the user has been given a new role.
		 *
		 * @since 4.3.0
		 *
		 * @param int    $user_id The user ID.
		 * @param string $role    The new role.
		 */
		do_action( 'add_user_role', $this->ID, $role );
	}

	/**
	 * Removes role from user.
	 *
	 * @since 2.0.0
	 *
	 * @param string $role Role name.
	 */
	public function remove_role( $role ) {
		if ( ! in_array( $role, $this->roles, true ) ) {
			return;
		}

		unset( $this->caps[ $role ] );
		update_user_meta( $this->ID, $this->cap_key, $this->caps );
		$this->get_role_caps();
		$this->update_user_level_from_caps();

		/**
		 * Fires immediately after a role as been removed from a user.
		 *
		 * @since 4.3.0
		 *
		 * @param int    $user_id The user ID.
		 * @param string $role    The removed role.
		 */
		do_action( 'remove_user_role', $this->ID, $role );
	}

	/**
	 * Sets the role of the user.
	 *
	 * This will remove the previous roles of the user and assign the user the
	 * new one. You can set the role to an empty string and it will remove all
	 * of the roles from the user.
	 *
	 * @since 2.0.0
	 *
	 * @param string $role Role name.
	 */
	public function set_role( $role ) {
		if ( 1 === count( $this->roles ) && current( $this->roles ) == $role ) {
			return;
		}

		foreach ( (array) $this->roles as $oldrole ) {
			unset( $this->caps[ $oldrole ] );
		}

		$old_roles = $this->roles;

		if ( ! empty( $role ) ) {
			$this->caps[ $role ] = true;
			$this->roles         = array( $role => true );
		} else {
			$this->roles = array();
		}

		update_user_meta( $this->ID, $this->cap_key, $this->caps );
		$this->get_role_caps();
		$this->update_user_level_from_caps();

		foreach ( $old_roles as $old_role ) {
			if ( ! $old_role || $old_role === $role ) {
				continue;
			}

			/** This action is documented in wp-includes/class-wp-user.php */
			do_action( 'remove_user_role', $this->ID, $old_role );
		}

		if ( $role && ! in_array( $role, $old_roles, true ) ) {
			/** This action is documented in wp-includes/class-wp-user.php */
			do_action( 'add_user_role', $this->ID, $role );
		}

		/**
		 * Fires after the user's role has changed.
		 *
		 * @since 2.9.0
		 * @since 3.6.0 Added $old_roles to include an array of the user's previous roles.
		 *
		 * @param int      $user_id   The user ID.
		 * @param string   $role      The new role.
		 * @param string[] $old_roles An array of the user's previous roles.
		 */
		do_action( 'set_user_role', $this->ID, $role, $old_roles );
	}

	/**
	 * Chooses the maximum level the user has.
	 *
	 * Will compare the level from the $item parameter against the $max
	 * parameter. If the item is incorrect, then just the $max parameter value
	 * will be returned.
	 *
	 * Used to get the max level based on the capabilities the user has. This
	 * is also based on roles, so if the user is assigned the Administrator role
	 * then the capability 'level_10' will exist and the user will get that
	 * value.
	 *
	 * @since 2.0.0
	 *
	 * @param int    $max  Max level of user.
	 * @param string $item Level capability name.
	 * @return int Max Level.
	 */
	public function level_reduction( $max, $item ) {
		if ( preg_match( '/^level_(10|[0-9])$/i', $item, $matches ) ) {
			$level = (int) $matches[1];
			return max( $max, $level );
		} else {
			return $max;
		}
	}

	/**
	 * Updates the maximum user level for the user.
	 *
	 * Updates the 'user_level' user metadata (includes prefix that is the
	 * database table prefix) with the maximum user level. Gets the value from
	 * the all of the capabilities that the user has.
	 *
	 * @since 2.0.0
	 *
	 * @global wpdb $wpdb WordPress database abstraction object.
	 */
	public function update_user_level_from_caps() {
		global $wpdb;
		$this->user_level = array_reduce( array_keys( $this->allcaps ), array( $this, 'level_reduction' ), 0 );
		update_user_meta( $this->ID, $wpdb->get_blog_prefix() . 'user_level', $this->user_level );
	}

	/**
	 * Adds capability and grant or deny access to capability.
	 *
	 * @since 2.0.0
	 *
	 * @param string $cap   Capability name.
	 * @param bool   $grant Whether to grant capability to user.
	 */
	public function add_cap( $cap, $grant = true ) {
		$this->caps[ $cap ] = $grant;
		update_user_meta( $this->ID, $this->cap_key, $this->caps );
		$this->get_role_caps();
		$this->update_user_level_from_caps();
	}

	/**
	 * Removes capability from user.
	 *
	 * @since 2.0.0
	 *
	 * @param string $cap Capability name.
	 */
	public function remove_cap( $cap ) {
		if ( ! isset( $this->caps[ $cap ] ) ) {
			return;
		}
		unset( $this->caps[ $cap ] );
		update_user_meta( $this->ID, $this->cap_key, $this->caps );
		$this->get_role_caps();
		$this->update_user_level_from_caps();
	}

	/**
	 * Removes all of the capabilities of the user.
	 *
	 * @since 2.1.0
	 *
	 * @global wpdb $wpdb WordPress database abstraction object.
	 */
	public function remove_all_caps() {
		global $wpdb;
		$this->caps = array();
		delete_user_meta( $this->ID, $this->cap_key );
		delete_user_meta( $this->ID, $wpdb->get_blog_prefix() . 'user_level' );
		$this->get_role_caps();
	}

	/**
	 * Returns whether the user has the specified capability.
	 *
	 * This function also accepts an ID of an object to check against if the capability is a meta capability. Meta
	 * capabilities such as `edit_post` and `edit_user` are capabilities used by the `map_meta_cap()` function to
	 * map to primitive capabilities that a user or role has, such as `edit_posts` and `edit_others_posts`.
	 *
	 * Example usage:
	 *
	 *     $user->has_cap( 'edit_posts' );
	 *     $user->has_cap( 'edit_post', $post->ID );
	 *     $user->has_cap( 'edit_post_meta', $post->ID, $meta_key );
	 *
	 * While checking against a role in place of a capability is supported in part, this practice is discouraged as it
	 * may produce unreliable results.
	 *
	 * @since 2.0.0
	 * @since 5.3.0 Formalized the existing and already documented `...$args` parameter
	 *              by adding it to the function signature.
	 *
	 * @see map_meta_cap()
	 *
	 * @param string $cap     Capability name.
	 * @param mixed  ...$args Optional further parameters, typically starting with an object ID.
	 * @return bool Whether the user has the given capability, or, if an object ID is passed, whether the user has
	 *              the given capability for that object.
	 */
	public function has_cap( $cap, ...$args ) {
		if ( is_numeric( $cap ) ) {
			_deprecated_argument( __FUNCTION__, '2.0.0', __( 'Usage of user levels is deprecated. Use capabilities instead.' ) );
			$cap = $this->translate_level_to_cap( $cap );
		}

		$caps = map_meta_cap( $cap, $this->ID, ...$args );

		// Multisite super admin has all caps by definition, Unless specifically denied.
		if ( is_multisite() && is_super_admin( $this->ID ) ) {
			if ( in_array( 'do_not_allow', $caps, true ) ) {
				return false;
			}
			return true;
		}

		// Maintain BC for the argument passed to the "user_has_cap" filter.
		$args = array_merge( array( $cap, $this->ID ), $args );

		/**
		 * Dynamically filter a user's capabilities.
		 *
		 * @since 2.0.0
		 * @since 3.7.0 Added the `$user` parameter.
		 *
		 * @param bool[]   $allcaps Array of key/value pairs where keys represent a capability name
		 *                          and boolean values represent whether the user has that capability.
		 * @param string[] $caps    Required primitive capabilities for the requested capability.
		 * @param array    $args {
		 *     Arguments that accompany the requested capability check.
		 *
		 *     @type string    $0 Requested capability.
		 *     @type int       $1 Concerned user ID.
		 *     @type mixed  ...$2 Optional second and further parameters, typically object ID.
		 * }
		 * @param WP_User  $user    The user object.
		 */
		$capabilities = apply_filters( 'user_has_cap', $this->allcaps, $caps, $args, $this );

		// Everyone is allowed to exist.
		$capabilities['exist'] = true;

		// Nobody is allowed to do things they are not allowed to do.
		unset( $capabilities['do_not_allow'] );

		// Must have ALL requested caps.
		foreach ( (array) $caps as $cap ) {
			if ( empty( $capabilities[ $cap ] ) ) {
				return false;
			}
		}

		return true;
	}

	/**
	 * Converts numeric level to level capability name.
	 *
	 * Prepends 'level_' to level number.
	 *
	 * @since 2.0.0
	 *
	 * @param int $level Level number, 1 to 10.
	 * @return string
	 */
	public function translate_level_to_cap( $level ) {
		return 'level_' . $level;
	}

	/**
	 * Sets the site to operate on. Defaults to the current site.
	 *
	 * @since 3.0.0
	 * @deprecated 4.9.0 Use WP_User::for_site()
	 *
	 * @param int $blog_id Optional. Site ID, defaults to current site.
	 */
	public function for_blog( $blog_id = '' ) {
		_deprecated_function( __METHOD__, '4.9.0', 'WP_User::for_site()' );

		$this->for_site( $blog_id );
	}

	/**
	 * Sets the site to operate on. Defaults to the current site.
	 *
	 * @since 4.9.0
	 *
	 * @global wpdb $wpdb WordPress database abstraction object.
	 *
	 * @param int $site_id Site ID to initialize user capabilities for. Default is the current site.
	 */
	public function for_site( $site_id = '' ) {
		global $wpdb;

		if ( ! empty( $site_id ) ) {
			$this->site_id = absint( $site_id );
		} else {
			$this->site_id = get_current_blog_id();
		}

		$this->cap_key = $wpdb->get_blog_prefix( $this->site_id ) . 'capabilities';

		$this->caps = $this->get_caps_data();

		$this->get_role_caps();
	}

	/**
	 * Gets the ID of the site for which the user's capabilities are currently initialized.
	 *
	 * @since 4.9.0
	 *
	 * @return int Site ID.
	 */
	public function get_site_id() {
		return $this->site_id;
	}

	/**
	 * Gets the available user capabilities data.
	 *
	 * @since 4.9.0
	 *
	 * @return bool[] List of capabilities keyed by the capability name,
	 *                e.g. array( 'edit_posts' => true, 'delete_posts' => false ).
	 */
	private function get_caps_data() {
		$caps = get_user_meta( $this->ID, $this->cap_key, true );

		if ( ! is_array( $caps ) ) {
			return array();
		}

		return $caps;
	}
}

```
## WP_Query
```php
class WP_Query {

	/**
	 * Query vars set by the user.
	 *
	 * @since 1.5.0
	 * @var array
	 */
	public $query;

	/**
	 * Query vars, after parsing.
	 *
	 * @since 1.5.0
	 * @var array
	 */
	public $query_vars = array();

	/**
	 * Taxonomy query, as passed to get_tax_sql().
	 *
	 * @since 3.1.0
	 * @var WP_Tax_Query A taxonomy query instance.
	 */
	public $tax_query;

	/**
	 * Metadata query container.
	 *
	 * @since 3.2.0
	 * @var WP_Meta_Query A meta query instance.
	 */
	public $meta_query = false;

	/**
	 * Date query container.
	 *
	 * @since 3.7.0
	 * @var WP_Date_Query A date query instance.
	 */
	public $date_query = false;

	/**
	 * Holds the data for a single object that is queried.
	 *
	 * Holds the contents of a post, page, category, attachment.
	 *
	 * @since 1.5.0
	 * @var WP_Term|WP_Post_Type|WP_Post|WP_User|null
	 */
	public $queried_object;

	/**
	 * The ID of the queried object.
	 *
	 * @since 1.5.0
	 * @var int
	 */
	public $queried_object_id;

	/**
	 * SQL for the database query.
	 *
	 * @since 2.0.1
	 * @var string
	 */
	public $request;

	/**
	 * Array of post objects or post IDs.
	 *
	 * @since 1.5.0
	 * @var WP_Post[]|int[]
	 */
	public $posts;

	/**
	 * The number of posts for the current query.
	 *
	 * @since 1.5.0
	 * @var int
	 */
	public $post_count = 0;

	/**
	 * Index of the current item in the loop.
	 *
	 * @since 1.5.0
	 * @var int
	 */
	public $current_post = -1;

	/**
	 * Whether the loop has started and the caller is in the loop.
	 *
	 * @since 2.0.0
	 * @var bool
	 */
	public $in_the_loop = false;

	/**
	 * The current post.
	 *
	 * This property does not get populated when the `fields` argument is set to
	 * `ids` or `id=>parent`.
	 *
	 * @since 1.5.0
	 * @var WP_Post|null
	 */
	public $post;

	/**
	 * The list of comments for current post.
	 *
	 * @since 2.2.0
	 * @var WP_Comment[]
	 */
	public $comments;

	/**
	 * The number of comments for the posts.
	 *
	 * @since 2.2.0
	 * @var int
	 */
	public $comment_count = 0;

	/**
	 * The index of the comment in the comment loop.
	 *
	 * @since 2.2.0
	 * @var int
	 */
	public $current_comment = -1;

	/**
	 * Current comment object.
	 *
	 * @since 2.2.0
	 * @var WP_Comment
	 */
	public $comment;

	/**
	 * The number of found posts for the current query.
	 *
	 * If limit clause was not used, equals $post_count.
	 *
	 * @since 2.1.0
	 * @var int
	 */
	public $found_posts = 0;

	/**
	 * The number of pages.
	 *
	 * @since 2.1.0
	 * @var int
	 */
	public $max_num_pages = 0;

	/**
	 * The number of comment pages.
	 *
	 * @since 2.7.0
	 * @var int
	 */
	public $max_num_comment_pages = 0;

	/**
	 * Signifies whether the current query is for a single post.
	 *
	 * @since 1.5.0
	 * @var bool
	 */
	public $is_single = false;

	/**
	 * Signifies whether the current query is for a preview.
	 *
	 * @since 2.0.0
	 * @var bool
	 */
	public $is_preview = false;

	/**
	 * Signifies whether the current query is for a page.
	 *
	 * @since 1.5.0
	 * @var bool
	 */
	public $is_page = false;

	/**
	 * Signifies whether the current query is for an archive.
	 *
	 * @since 1.5.0
	 * @var bool
	 */
	public $is_archive = false;

	/**
	 * Signifies whether the current query is for a date archive.
	 *
	 * @since 1.5.0
	 * @var bool
	 */
	public $is_date = false;

	/**
	 * Signifies whether the current query is for a year archive.
	 *
	 * @since 1.5.0
	 * @var bool
	 */
	public $is_year = false;

	/**
	 * Signifies whether the current query is for a month archive.
	 *
	 * @since 1.5.0
	 * @var bool
	 */
	public $is_month = false;

	/**
	 * Signifies whether the current query is for a day archive.
	 *
	 * @since 1.5.0
	 * @var bool
	 */
	public $is_day = false;

	/**
	 * Signifies whether the current query is for a specific time.
	 *
	 * @since 1.5.0
	 * @var bool
	 */
	public $is_time = false;

	/**
	 * Signifies whether the current query is for an author archive.
	 *
	 * @since 1.5.0
	 * @var bool
	 */
	public $is_author = false;

	/**
	 * Signifies whether the current query is for a category archive.
	 *
	 * @since 1.5.0
	 * @var bool
	 */
	public $is_category = false;

	/**
	 * Signifies whether the current query is for a tag archive.
	 *
	 * @since 2.3.0
	 * @var bool
	 */
	public $is_tag = false;

	/**
	 * Signifies whether the current query is for a taxonomy archive.
	 *
	 * @since 2.5.0
	 * @var bool
	 */
	public $is_tax = false;

	/**
	 * Signifies whether the current query is for a search.
	 *
	 * @since 1.5.0
	 * @var bool
	 */
	public $is_search = false;

	/**
	 * Signifies whether the current query is for a feed.
	 *
	 * @since 1.5.0
	 * @var bool
	 */
	public $is_feed = false;

	/**
	 * Signifies whether the current query is for a comment feed.
	 *
	 * @since 2.2.0
	 * @var bool
	 */
	public $is_comment_feed = false;

	/**
	 * Signifies whether the current query is for trackback endpoint call.
	 *
	 * @since 1.5.0
	 * @var bool
	 */
	public $is_trackback = false;

	/**
	 * Signifies whether the current query is for the site homepage.
	 *
	 * @since 1.5.0
	 * @var bool
	 */
	public $is_home = false;

	/**
	 * Signifies whether the current query is for the Privacy Policy page.
	 *
	 * @since 5.2.0
	 * @var bool
	 */
	public $is_privacy_policy = false;

	/**
	 * Signifies whether the current query couldn't find anything.
	 *
	 * @since 1.5.0
	 * @var bool
	 */
	public $is_404 = false;

	/**
	 * Signifies whether the current query is for an embed.
	 *
	 * @since 4.4.0
	 * @var bool
	 */
	public $is_embed = false;

	/**
	 * Signifies whether the current query is for a paged result and not for the first page.
	 *
	 * @since 1.5.0
	 * @var bool
	 */
	public $is_paged = false;

	/**
	 * Signifies whether the current query is for an administrative interface page.
	 *
	 * @since 1.5.0
	 * @var bool
	 */
	public $is_admin = false;

	/**
	 * Signifies whether the current query is for an attachment page.
	 *
	 * @since 2.0.0
	 * @var bool
	 */
	public $is_attachment = false;

	/**
	 * Signifies whether the current query is for an existing single post of any post type
	 * (post, attachment, page, custom post types).
	 *
	 * @since 2.1.0
	 * @var bool
	 */
	public $is_singular = false;

	/**
	 * Signifies whether the current query is for the robots.txt file.
	 *
	 * @since 2.1.0
	 * @var bool
	 */
	public $is_robots = false;

	/**
	 * Signifies whether the current query is for the favicon.ico file.
	 *
	 * @since 5.4.0
	 * @var bool
	 */
	public $is_favicon = false;

	/**
	 * Signifies whether the current query is for the page_for_posts page.
	 *
	 * Basically, the homepage if the option isn't set for the static homepage.
	 *
	 * @since 2.1.0
	 * @var bool
	 */
	public $is_posts_page = false;

	/**
	 * Signifies whether the current query is for a post type archive.
	 *
	 * @since 3.1.0
	 * @var bool
	 */
	public $is_post_type_archive = false;

	/**
	 * Stores the ->query_vars state like md5(serialize( $this->query_vars ) ) so we know
	 * whether we have to re-parse because something has changed
	 *
	 * @since 3.1.0
	 * @var bool|string
	 */
	private $query_vars_hash = false;

	/**
	 * Whether query vars have changed since the initial parse_query() call. Used to catch modifications to query vars made
	 * via pre_get_posts hooks.
	 *
	 * @since 3.1.1
	 */
	private $query_vars_changed = true;

	/**
	 * Set if post thumbnails are cached
	 *
	 * @since 3.2.0
	 * @var bool
	 */
	public $thumbnails_cached = false;

	/**
	 * Cached list of search stopwords.
	 *
	 * @since 3.7.0
	 * @var array
	 */
	private $stopwords;

	private $compat_fields = array( 'query_vars_hash', 'query_vars_changed' );

	private $compat_methods = array( 'init_query_flags', 'parse_tax_query' );

	/**
	 * Resets query flags to false.
	 *
	 * The query flags are what page info WordPress was able to figure out.
	 *
	 * @since 2.0.0
	 */
	private function init_query_flags() {
		$this->is_single            = false;
		$this->is_preview           = false;
		$this->is_page              = false;
		$this->is_archive           = false;
		$this->is_date              = false;
		$this->is_year              = false;
		$this->is_month             = false;
		$this->is_day               = false;
		$this->is_time              = false;
		$this->is_author            = false;
		$this->is_category          = false;
		$this->is_tag               = false;
		$this->is_tax               = false;
		$this->is_search            = false;
		$this->is_feed              = false;
		$this->is_comment_feed      = false;
		$this->is_trackback         = false;
		$this->is_home              = false;
		$this->is_privacy_policy    = false;
		$this->is_404               = false;
		$this->is_paged             = false;
		$this->is_admin             = false;
		$this->is_attachment        = false;
		$this->is_singular          = false;
		$this->is_robots            = false;
		$this->is_favicon           = false;
		$this->is_posts_page        = false;
		$this->is_post_type_archive = false;
	}

	/**
	 * Initiates object properties and sets default values.
	 *
	 * @since 1.5.0
	 */
	public function init() {
		unset( $this->posts );
		unset( $this->query );
		$this->query_vars = array();
		unset( $this->queried_object );
		unset( $this->queried_object_id );
		$this->post_count   = 0;
		$this->current_post = -1;
		$this->in_the_loop  = false;
		unset( $this->request );
		unset( $this->post );
		unset( $this->comments );
		unset( $this->comment );
		$this->comment_count         = 0;
		$this->current_comment       = -1;
		$this->found_posts           = 0;
		$this->max_num_pages         = 0;
		$this->max_num_comment_pages = 0;

		$this->init_query_flags();
	}

	/**
	 * Reparse the query vars.
	 *
	 * @since 1.5.0
	 */
	public function parse_query_vars() {
		$this->parse_query();
	}

	/**
	 * Fills in the query variables, which do not exist within the parameter.
	 *
	 * @since 2.1.0
	 * @since 4.5.0 Removed the `comments_popup` public query variable.
	 *
	 * @param array $query_vars Defined query variables.
	 * @return array Complete query variables with undefined ones filled in empty.
	 */
	public function fill_query_vars( $query_vars ) {
		$keys = array(
			'error',
			'm',
			'p',
			'post_parent',
			'subpost',
			'subpost_id',
			'attachment',
			'attachment_id',
			'name',
			'pagename',
			'page_id',
			'second',
			'minute',
			'hour',
			'day',
			'monthnum',
			'year',
			'w',
			'category_name',
			'tag',
			'cat',
			'tag_id',
			'author',
			'author_name',
			'feed',
			'tb',
			'paged',
			'meta_key',
			'meta_value',
			'preview',
			's',
			'sentence',
			'title',
			'fields',
			'menu_order',
			'embed',
		);

		foreach ( $keys as $key ) {
			if ( ! isset( $query_vars[ $key ] ) ) {
				$query_vars[ $key ] = '';
			}
		}

		$array_keys = array(
			'category__in',
			'category__not_in',
			'category__and',
			'post__in',
			'post__not_in',
			'post_name__in',
			'tag__in',
			'tag__not_in',
			'tag__and',
			'tag_slug__in',
			'tag_slug__and',
			'post_parent__in',
			'post_parent__not_in',
			'author__in',
			'author__not_in',
		);

		foreach ( $array_keys as $key ) {
			if ( ! isset( $query_vars[ $key ] ) ) {
				$query_vars[ $key ] = array();
			}
		}

		return $query_vars;
	}

	/**
	 * Parse a query string and set query type booleans.
	 *
	 * @since 1.5.0
	 * @since 4.2.0 Introduced the ability to order by specific clauses of a `$meta_query`, by passing the clause's
	 *              array key to `$orderby`.
	 * @since 4.4.0 Introduced `$post_name__in` and `$title` parameters. `$s` was updated to support excluded
	 *              search terms, by prepending a hyphen.
	 * @since 4.5.0 Removed the `$comments_popup` parameter.
	 *              Introduced the `$comment_status` and `$ping_status` parameters.
	 *              Introduced `RAND(x)` syntax for `$orderby`, which allows an integer seed value to random sorts.
	 * @since 4.6.0 Added 'post_name__in' support for `$orderby`. Introduced the `$lazy_load_term_meta` argument.
	 * @since 4.9.0 Introduced the `$comment_count` parameter.
	 * @since 5.1.0 Introduced the `$meta_compare_key` parameter.
	 * @since 5.3.0 Introduced the `$meta_type_key` parameter.
	 *
	 * @param string|array $query {
	 *     Optional. Array or string of Query parameters.
	 *
	 *     @type int             $attachment_id           Attachment post ID. Used for 'attachment' post_type.
	 *     @type int|string      $author                  Author ID, or comma-separated list of IDs.
	 *     @type string          $author_name             User 'user_nicename'.
	 *     @type int[]           $author__in              An array of author IDs to query from.
	 *     @type int[]           $author__not_in          An array of author IDs not to query from.
	 *     @type bool            $cache_results           Whether to cache post information. Default true.
	 *     @type int|string      $cat                     Category ID or comma-separated list of IDs (this or any children).
	 *     @type int[]           $category__and           An array of category IDs (AND in).
	 *     @type int[]           $category__in            An array of category IDs (OR in, no children).
	 *     @type int[]           $category__not_in        An array of category IDs (NOT in).
	 *     @type string          $category_name           Use category slug (not name, this or any children).
	 *     @type array|int       $comment_count           Filter results by comment count. Provide an integer to match
	 *                                                    comment count exactly. Provide an array with integer 'value'
	 *                                                    and 'compare' operator ('=', '!=', '>', '>=', '<', '<=' ) to
	 *                                                    compare against comment_count in a specific way.
	 *     @type string          $comment_status          Comment status.
	 *     @type int             $comments_per_page       The number of comments to return per page.
	 *                                                    Default 'comments_per_page' option.
	 *     @type array           $date_query              An associative array of WP_Date_Query arguments.
	 *                                                    See WP_Date_Query::__construct().
	 *     @type int             $day                     Day of the month. Default empty. Accepts numbers 1-31.
	 *     @type bool            $exact                   Whether to search by exact keyword. Default false.
	 *     @type string          $fields                  Post fields to query for. Accepts:
	 *                                                    - '' Returns an array of complete post objects (`WP_Post[]`).
	 *                                                    - 'ids' Returns an array of post IDs (`int[]`).
	 *                                                    - 'id=>parent' Returns an associative array of parent post IDs,
	 *                                                      keyed by post ID (`int[]`).
	 *                                                    Default ''.
	 *     @type int             $hour                    Hour of the day. Default empty. Accepts numbers 0-23.
	 *     @type int|bool        $ignore_sticky_posts     Whether to ignore sticky posts or not. Setting this to false
	 *                                                    excludes stickies from 'post__in'. Accepts 1|true, 0|false.
	 *                                                    Default false.
	 *     @type int             $m                       Combination YearMonth. Accepts any four-digit year and month
	 *                                                    numbers 1-12. Default empty.
	 *     @type string|string[] $meta_key                Meta key or keys to filter by.
	 *     @type string|string[] $meta_value              Meta value or values to filter by.
	 *     @type string          $meta_compare            MySQL operator used for comparing the meta value.
	 *                                                    See WP_Meta_Query::__construct for accepted values and default value.
	 *     @type string          $meta_compare_key        MySQL operator used for comparing the meta key.
	 *                                                    See WP_Meta_Query::__construct for accepted values and default value.
	 *     @type string          $meta_type               MySQL data type that the meta_value column will be CAST to for comparisons.
	 *                                                    See WP_Meta_Query::__construct for accepted values and default value.
	 *     @type string          $meta_type_key           MySQL data type that the meta_key column will be CAST to for comparisons.
	 *                                                    See WP_Meta_Query::__construct for accepted values and default value.
	 *     @type array           $meta_query              An associative array of WP_Meta_Query arguments.
	 *                                                    See WP_Meta_Query::__construct for accepted values.
	 *     @type int             $menu_order              The menu order of the posts.
	 *     @type int             $minute                  Minute of the hour. Default empty. Accepts numbers 0-59.
	 *     @type int             $monthnum                The two-digit month. Default empty. Accepts numbers 1-12.
	 *     @type string          $name                    Post slug.
	 *     @type bool            $nopaging                Show all posts (true) or paginate (false). Default false.
	 *     @type bool            $no_found_rows           Whether to skip counting the total rows found. Enabling can improve
	 *                                                    performance. Default false.
	 *     @type int             $offset                  The number of posts to offset before retrieval.
	 *     @type string          $order                   Designates ascending or descending order of posts. Default 'DESC'.
	 *                                                    Accepts 'ASC', 'DESC'.
	 *     @type string|array    $orderby                 Sort retrieved posts by parameter. One or more options may be passed.
	 *                                                    To use 'meta_value', or 'meta_value_num', 'meta_key=keyname' must be
	 *                                                    also be defined. To sort by a specific `$meta_query` clause, use that
	 *                                                    clause's array key. Accepts:
	 *                                                    - 'none'
	 *                                                    - 'name'
	 *                                                    - 'author'
	 *                                                    - 'date'
	 *                                                    - 'title'
	 *                                                    - 'modified'
	 *                                                    - 'menu_order'
	 *                                                    - 'parent'
	 *                                                    - 'ID'
	 *                                                    - 'rand'
	 *                                                    - 'relevance'
	 *                                                    - 'RAND(x)' (where 'x' is an integer seed value)
	 *                                                    - 'comment_count'
	 *                                                    - 'meta_value'
	 *                                                    - 'meta_value_num'
	 *                                                    - 'post__in'
	 *                                                    - 'post_name__in'
	 *                                                    - 'post_parent__in'
	 *                                                    - The array keys of `$meta_query`.
	 *                                                    Default is 'date', except when a search is being performed, when
	 *                                                    the default is 'relevance'.
	 *     @type int             $p                       Post ID.
	 *     @type int             $page                    Show the number of posts that would show up on page X of a
	 *                                                    static front page.
	 *     @type int             $paged                   The number of the current page.
	 *     @type int             $page_id                 Page ID.
	 *     @type string          $pagename                Page slug.
	 *     @type string          $perm                    Show posts if user has the appropriate capability.
	 *     @type string          $ping_status             Ping status.
	 *     @type int[]           $post__in                An array of post IDs to retrieve, sticky posts will be included.
	 *     @type int[]           $post__not_in            An array of post IDs not to retrieve. Note: a string of comma-
	 *                                                    separated IDs will NOT work.
	 *     @type string          $post_mime_type          The mime type of the post. Used for 'attachment' post_type.
	 *     @type string[]        $post_name__in           An array of post slugs that results must match.
	 *     @type int             $post_parent             Page ID to retrieve child pages for. Use 0 to only retrieve
	 *                                                    top-level pages.
	 *     @type int[]           $post_parent__in         An array containing parent page IDs to query child pages from.
	 *     @type int[]           $post_parent__not_in     An array containing parent page IDs not to query child pages from.
	 *     @type string|string[] $post_type               A post type slug (string) or array of post type slugs.
	 *                                                    Default 'any' if using 'tax_query'.
	 *     @type string|string[] $post_status             A post status (string) or array of post statuses.
	 *     @type int             $posts_per_page          The number of posts to query for. Use -1 to request all posts.
	 *     @type int             $posts_per_archive_page  The number of posts to query for by archive page. Overrides
	 *                                                    'posts_per_page' when is_archive(), or is_search() are true.
	 *     @type string          $s                       Search keyword(s). Prepending a term with a hyphen will
	 *                                                    exclude posts matching that term. Eg, 'pillow -sofa' will
	 *                                                    return posts containing 'pillow' but not 'sofa'. The
	 *                                                    character used for exclusion can be modified using the
	 *                                                    the 'wp_query_search_exclusion_prefix' filter.
	 *     @type int             $second                  Second of the minute. Default empty. Accepts numbers 0-59.
	 *     @type bool            $sentence                Whether to search by phrase. Default false.
	 *     @type bool            $suppress_filters        Whether to suppress filters. Default false.
	 *     @type string          $tag                     Tag slug. Comma-separated (either), Plus-separated (all).
	 *     @type int[]           $tag__and                An array of tag IDs (AND in).
	 *     @type int[]           $tag__in                 An array of tag IDs (OR in).
	 *     @type int[]           $tag__not_in             An array of tag IDs (NOT in).
	 *     @type int             $tag_id                  Tag id or comma-separated list of IDs.
	 *     @type string[]        $tag_slug__and           An array of tag slugs (AND in).
	 *     @type string[]        $tag_slug__in            An array of tag slugs (OR in). unless 'ignore_sticky_posts' is
	 *                                                    true. Note: a string of comma-separated IDs will NOT work.
	 *     @type array           $tax_query               An associative array of WP_Tax_Query arguments.
	 *                                                    See WP_Tax_Query->__construct().
	 *     @type string          $title                   Post title.
	 *     @type bool            $update_post_meta_cache  Whether to update the post meta cache. Default true.
	 *     @type bool            $update_post_term_cache  Whether to update the post term cache. Default true.
	 *     @type bool            $lazy_load_term_meta     Whether to lazy-load term meta. Setting to false will
	 *                                                    disable cache priming for term meta, so that each
	 *                                                    get_term_meta() call will hit the database.
	 *                                                    Defaults to the value of `$update_post_term_cache`.
	 *     @type int             $w                       The week number of the year. Default empty. Accepts numbers 0-53.
	 *     @type int             $year                    The four-digit year. Default empty. Accepts any four-digit year.
	 * }
	 */
	public function parse_query( $query = '' ) {
		if ( ! empty( $query ) ) {
			$this->init();
			$this->query      = wp_parse_args( $query );
			$this->query_vars = $this->query;
		} elseif ( ! isset( $this->query ) ) {
			$this->query = $this->query_vars;
		}

		$this->query_vars         = $this->fill_query_vars( $this->query_vars );
		$qv                       = &$this->query_vars;
		$this->query_vars_changed = true;

		if ( ! empty( $qv['robots'] ) ) {
			$this->is_robots = true;
		} elseif ( ! empty( $qv['favicon'] ) ) {
			$this->is_favicon = true;
		}

		if ( ! is_scalar( $qv['p'] ) || (int) $qv['p'] < 0 ) {
			$qv['p']     = 0;
			$qv['error'] = '404';
		} else {
			$qv['p'] = (int) $qv['p'];
		}

		$qv['page_id']  = absint( $qv['page_id'] );
		$qv['year']     = absint( $qv['year'] );
		$qv['monthnum'] = absint( $qv['monthnum'] );
		$qv['day']      = absint( $qv['day'] );
		$qv['w']        = absint( $qv['w'] );
		$qv['m']        = is_scalar( $qv['m'] ) ? preg_replace( '|[^0-9]|', '', $qv['m'] ) : '';
		$qv['paged']    = absint( $qv['paged'] );
		$qv['cat']      = preg_replace( '|[^0-9,-]|', '', $qv['cat'] );    // Comma-separated list of positive or negative integers.
		$qv['author']   = preg_replace( '|[^0-9,-]|', '', $qv['author'] ); // Comma-separated list of positive or negative integers.
		$qv['pagename'] = trim( $qv['pagename'] );
		$qv['name']     = trim( $qv['name'] );
		$qv['title']    = trim( $qv['title'] );
		if ( '' !== $qv['hour'] ) {
			$qv['hour'] = absint( $qv['hour'] );
		}
		if ( '' !== $qv['minute'] ) {
			$qv['minute'] = absint( $qv['minute'] );
		}
		if ( '' !== $qv['second'] ) {
			$qv['second'] = absint( $qv['second'] );
		}
		if ( '' !== $qv['menu_order'] ) {
			$qv['menu_order'] = absint( $qv['menu_order'] );
		}

		// Fairly large, potentially too large, upper bound for search string lengths.
		if ( ! is_scalar( $qv['s'] ) || ( ! empty( $qv['s'] ) && strlen( $qv['s'] ) > 1600 ) ) {
			$qv['s'] = '';
		}

		// Compat. Map subpost to attachment.
		if ( '' != $qv['subpost'] ) {
			$qv['attachment'] = $qv['subpost'];
		}
		if ( '' != $qv['subpost_id'] ) {
			$qv['attachment_id'] = $qv['subpost_id'];
		}

		$qv['attachment_id'] = absint( $qv['attachment_id'] );

		if ( ( '' !== $qv['attachment'] ) || ! empty( $qv['attachment_id'] ) ) {
			$this->is_single     = true;
			$this->is_attachment = true;
		} elseif ( '' !== $qv['name'] ) {
			$this->is_single = true;
		} elseif ( $qv['p'] ) {
			$this->is_single = true;
		} elseif ( '' !== $qv['pagename'] || ! empty( $qv['page_id'] ) ) {
			$this->is_page   = true;
			$this->is_single = false;
		} else {
			// Look for archive queries. Dates, categories, authors, search, post type archives.

			if ( isset( $this->query['s'] ) ) {
				$this->is_search = true;
			}

			if ( '' !== $qv['second'] ) {
				$this->is_time = true;
				$this->is_date = true;
			}

			if ( '' !== $qv['minute'] ) {
				$this->is_time = true;
				$this->is_date = true;
			}

			if ( '' !== $qv['hour'] ) {
				$this->is_time = true;
				$this->is_date = true;
			}

			if ( $qv['day'] ) {
				if ( ! $this->is_date ) {
					$date = sprintf( '%04d-%02d-%02d', $qv['year'], $qv['monthnum'], $qv['day'] );
					if ( $qv['monthnum'] && $qv['year'] && ! wp_checkdate( $qv['monthnum'], $qv['day'], $qv['year'], $date ) ) {
						$qv['error'] = '404';
					} else {
						$this->is_day  = true;
						$this->is_date = true;
					}
				}
			}

			if ( $qv['monthnum'] ) {
				if ( ! $this->is_date ) {
					if ( 12 < $qv['monthnum'] ) {
						$qv['error'] = '404';
					} else {
						$this->is_month = true;
						$this->is_date  = true;
					}
				}
			}

			if ( $qv['year'] ) {
				if ( ! $this->is_date ) {
					$this->is_year = true;
					$this->is_date = true;
				}
			}

			if ( $qv['m'] ) {
				$this->is_date = true;
				if ( strlen( $qv['m'] ) > 9 ) {
					$this->is_time = true;
				} elseif ( strlen( $qv['m'] ) > 7 ) {
					$this->is_day = true;
				} elseif ( strlen( $qv['m'] ) > 5 ) {
					$this->is_month = true;
				} else {
					$this->is_year = true;
				}
			}

			if ( $qv['w'] ) {
				$this->is_date = true;
			}

			$this->query_vars_hash = false;
			$this->parse_tax_query( $qv );

			foreach ( $this->tax_query->queries as $tax_query ) {
				if ( ! is_array( $tax_query ) ) {
					continue;
				}

				if ( isset( $tax_query['operator'] ) && 'NOT IN' !== $tax_query['operator'] ) {
					switch ( $tax_query['taxonomy'] ) {
						case 'category':
							$this->is_category = true;
							break;
						case 'post_tag':
							$this->is_tag = true;
							break;
						default:
							$this->is_tax = true;
					}
				}
			}
			unset( $tax_query );

			if ( empty( $qv['author'] ) || ( '0' == $qv['author'] ) ) {
				$this->is_author = false;
			} else {
				$this->is_author = true;
			}

			if ( '' !== $qv['author_name'] ) {
				$this->is_author = true;
			}

			if ( ! empty( $qv['post_type'] ) && ! is_array( $qv['post_type'] ) ) {
				$post_type_obj = get_post_type_object( $qv['post_type'] );
				if ( ! empty( $post_type_obj->has_archive ) ) {
					$this->is_post_type_archive = true;
				}
			}

			if ( $this->is_post_type_archive || $this->is_date || $this->is_author || $this->is_category || $this->is_tag || $this->is_tax ) {
				$this->is_archive = true;
			}
		}

		if ( '' != $qv['feed'] ) {
			$this->is_feed = true;
		}

		if ( '' != $qv['embed'] ) {
			$this->is_embed = true;
		}

		if ( '' != $qv['tb'] ) {
			$this->is_trackback = true;
		}

		if ( '' != $qv['paged'] && ( (int) $qv['paged'] > 1 ) ) {
			$this->is_paged = true;
		}

		// If we're previewing inside the write screen.
		if ( '' != $qv['preview'] ) {
			$this->is_preview = true;
		}

		if ( is_admin() ) {
			$this->is_admin = true;
		}

		if ( false !== strpos( $qv['feed'], 'comments-' ) ) {
			$qv['feed']         = str_replace( 'comments-', '', $qv['feed'] );
			$qv['withcomments'] = 1;
		}

		$this->is_singular = $this->is_single || $this->is_page || $this->is_attachment;

		if ( $this->is_feed && ( ! empty( $qv['withcomments'] ) || ( empty( $qv['withoutcomments'] ) && $this->is_singular ) ) ) {
			$this->is_comment_feed = true;
		}

		if ( ! ( $this->is_singular || $this->is_archive || $this->is_search || $this->is_feed
				|| ( defined( 'REST_REQUEST' ) && REST_REQUEST && $this->is_main_query() )
				|| $this->is_trackback || $this->is_404 || $this->is_admin || $this->is_robots || $this->is_favicon ) ) {
			$this->is_home = true;
		}

		// Correct `is_*` for 'page_on_front' and 'page_for_posts'.
		if ( $this->is_home && 'page' === get_option( 'show_on_front' ) && get_option( 'page_on_front' ) ) {
			$_query = wp_parse_args( $this->query );
			// 'pagename' can be set and empty depending on matched rewrite rules. Ignore an empty 'pagename'.
			if ( isset( $_query['pagename'] ) && '' === $_query['pagename'] ) {
				unset( $_query['pagename'] );
			}

			unset( $_query['embed'] );

			if ( empty( $_query ) || ! array_diff( array_keys( $_query ), array( 'preview', 'page', 'paged', 'cpage' ) ) ) {
				$this->is_page = true;
				$this->is_home = false;
				$qv['page_id'] = get_option( 'page_on_front' );
				// Correct <!--nextpage--> for 'page_on_front'.
				if ( ! empty( $qv['paged'] ) ) {
					$qv['page'] = $qv['paged'];
					unset( $qv['paged'] );
				}
			}
		}

		if ( '' !== $qv['pagename'] ) {
			$this->queried_object = get_page_by_path( $qv['pagename'] );

			if ( $this->queried_object && 'attachment' === $this->queried_object->post_type ) {
				if ( preg_match( '/^[^%]*%(?:postname)%/', get_option( 'permalink_structure' ) ) ) {
					// See if we also have a post with the same slug.
					$post = get_page_by_path( $qv['pagename'], OBJECT, 'post' );
					if ( $post ) {
						$this->queried_object = $post;
						$this->is_page        = false;
						$this->is_single      = true;
					}
				}
			}

			if ( ! empty( $this->queried_object ) ) {
				$this->queried_object_id = (int) $this->queried_object->ID;
			} else {
				unset( $this->queried_object );
			}

			if ( 'page' === get_option( 'show_on_front' ) && isset( $this->queried_object_id ) && get_option( 'page_for_posts' ) == $this->queried_object_id ) {
				$this->is_page       = false;
				$this->is_home       = true;
				$this->is_posts_page = true;
			}

			if ( isset( $this->queried_object_id ) && get_option( 'wp_page_for_privacy_policy' ) == $this->queried_object_id ) {
				$this->is_privacy_policy = true;
			}
		}

		if ( $qv['page_id'] ) {
			if ( 'page' === get_option( 'show_on_front' ) && get_option( 'page_for_posts' ) == $qv['page_id'] ) {
				$this->is_page       = false;
				$this->is_home       = true;
				$this->is_posts_page = true;
			}

			if ( get_option( 'wp_page_for_privacy_policy' ) == $qv['page_id'] ) {
				$this->is_privacy_policy = true;
			}
		}

		if ( ! empty( $qv['post_type'] ) ) {
			if ( is_array( $qv['post_type'] ) ) {
				$qv['post_type'] = array_map( 'sanitize_key', $qv['post_type'] );
			} else {
				$qv['post_type'] = sanitize_key( $qv['post_type'] );
			}
		}

		if ( ! empty( $qv['post_status'] ) ) {
			if ( is_array( $qv['post_status'] ) ) {
				$qv['post_status'] = array_map( 'sanitize_key', $qv['post_status'] );
			} else {
				$qv['post_status'] = preg_replace( '|[^a-z0-9_,-]|', '', $qv['post_status'] );
			}
		}

		if ( $this->is_posts_page && ( ! isset( $qv['withcomments'] ) || ! $qv['withcomments'] ) ) {
			$this->is_comment_feed = false;
		}

		$this->is_singular = $this->is_single || $this->is_page || $this->is_attachment;
		// Done correcting `is_*` for 'page_on_front' and 'page_for_posts'.

		if ( '404' == $qv['error'] ) {
			$this->set_404();
		}

		$this->is_embed = $this->is_embed && ( $this->is_singular || $this->is_404 );

		$this->query_vars_hash    = md5( serialize( $this->query_vars ) );
		$this->query_vars_changed = false;

		/**
		 * Fires after the main query vars have been parsed.
		 *
		 * @since 1.5.0
		 *
		 * @param WP_Query $query The WP_Query instance (passed by reference).
		 */
		do_action_ref_array( 'parse_query', array( &$this ) );
	}

	/**
	 * Parses various taxonomy related query vars.
	 *
	 * For BC, this method is not marked as protected. See [28987].
	 *
	 * @since 3.1.0
	 *
	 * @param array $q The query variables. Passed by reference.
	 */
	public function parse_tax_query( &$q ) {
		if ( ! empty( $q['tax_query'] ) && is_array( $q['tax_query'] ) ) {
			$tax_query = $q['tax_query'];
		} else {
			$tax_query = array();
		}

		if ( ! empty( $q['taxonomy'] ) && ! empty( $q['term'] ) ) {
			$tax_query[] = array(
				'taxonomy' => $q['taxonomy'],
				'terms'    => array( $q['term'] ),
				'field'    => 'slug',
			);
		}

		foreach ( get_taxonomies( array(), 'objects' ) as $taxonomy => $t ) {
			if ( 'post_tag' === $taxonomy ) {
				continue; // Handled further down in the $q['tag'] block.
			}

			if ( $t->query_var && ! empty( $q[ $t->query_var ] ) ) {
				$tax_query_defaults = array(
					'taxonomy' => $taxonomy,
					'field'    => 'slug',
				);

				if ( ! empty( $t->rewrite['hierarchical'] ) ) {
					$q[ $t->query_var ] = wp_basename( $q[ $t->query_var ] );
				}

				$term = $q[ $t->query_var ];

				if ( is_array( $term ) ) {
					$term = implode( ',', $term );
				}

				if ( strpos( $term, '+' ) !== false ) {
					$terms = preg_split( '/[+]+/', $term );
					foreach ( $terms as $term ) {
						$tax_query[] = array_merge(
							$tax_query_defaults,
							array(
								'terms' => array( $term ),
							)
						);
					}
				} else {
					$tax_query[] = array_merge(
						$tax_query_defaults,
						array(
							'terms' => preg_split( '/[,]+/', $term ),
						)
					);
				}
			}
		}

		// If query string 'cat' is an array, implode it.
		if ( is_array( $q['cat'] ) ) {
			$q['cat'] = implode( ',', $q['cat'] );
		}

		// Category stuff.

		if ( ! empty( $q['cat'] ) && ! $this->is_singular ) {
			$cat_in     = array();
			$cat_not_in = array();

			$cat_array = preg_split( '/[,\s]+/', urldecode( $q['cat'] ) );
			$cat_array = array_map( 'intval', $cat_array );
			$q['cat']  = implode( ',', $cat_array );

			foreach ( $cat_array as $cat ) {
				if ( $cat > 0 ) {
					$cat_in[] = $cat;
				} elseif ( $cat < 0 ) {
					$cat_not_in[] = abs( $cat );
				}
			}

			if ( ! empty( $cat_in ) ) {
				$tax_query[] = array(
					'taxonomy'         => 'category',
					'terms'            => $cat_in,
					'field'            => 'term_id',
					'include_children' => true,
				);
			}

			if ( ! empty( $cat_not_in ) ) {
				$tax_query[] = array(
					'taxonomy'         => 'category',
					'terms'            => $cat_not_in,
					'field'            => 'term_id',
					'operator'         => 'NOT IN',
					'include_children' => true,
				);
			}
			unset( $cat_array, $cat_in, $cat_not_in );
		}

		if ( ! empty( $q['category__and'] ) && 1 === count( (array) $q['category__and'] ) ) {
			$q['category__and'] = (array) $q['category__and'];
			if ( ! isset( $q['category__in'] ) ) {
				$q['category__in'] = array();
			}
			$q['category__in'][] = absint( reset( $q['category__and'] ) );
			unset( $q['category__and'] );
		}

		if ( ! empty( $q['category__in'] ) ) {
			$q['category__in'] = array_map( 'absint', array_unique( (array) $q['category__in'] ) );
			$tax_query[]       = array(
				'taxonomy'         => 'category',
				'terms'            => $q['category__in'],
				'field'            => 'term_id',
				'include_children' => false,
			);
		}

		if ( ! empty( $q['category__not_in'] ) ) {
			$q['category__not_in'] = array_map( 'absint', array_unique( (array) $q['category__not_in'] ) );
			$tax_query[]           = array(
				'taxonomy'         => 'category',
				'terms'            => $q['category__not_in'],
				'operator'         => 'NOT IN',
				'include_children' => false,
			);
		}

		if ( ! empty( $q['category__and'] ) ) {
			$q['category__and'] = array_map( 'absint', array_unique( (array) $q['category__and'] ) );
			$tax_query[]        = array(
				'taxonomy'         => 'category',
				'terms'            => $q['category__and'],
				'field'            => 'term_id',
				'operator'         => 'AND',
				'include_children' => false,
			);
		}

		// If query string 'tag' is array, implode it.
		if ( is_array( $q['tag'] ) ) {
			$q['tag'] = implode( ',', $q['tag'] );
		}

		// Tag stuff.

		if ( '' !== $q['tag'] && ! $this->is_singular && $this->query_vars_changed ) {
			if ( strpos( $q['tag'], ',' ) !== false ) {
				$tags = preg_split( '/[,\r\n\t ]+/', $q['tag'] );
				foreach ( (array) $tags as $tag ) {
					$tag                 = sanitize_term_field( 'slug', $tag, 0, 'post_tag', 'db' );
					$q['tag_slug__in'][] = $tag;
				}
			} elseif ( preg_match( '/[+\r\n\t ]+/', $q['tag'] ) || ! empty( $q['cat'] ) ) {
				$tags = preg_split( '/[+\r\n\t ]+/', $q['tag'] );
				foreach ( (array) $tags as $tag ) {
					$tag                  = sanitize_term_field( 'slug', $tag, 0, 'post_tag', 'db' );
					$q['tag_slug__and'][] = $tag;
				}
			} else {
				$q['tag']            = sanitize_term_field( 'slug', $q['tag'], 0, 'post_tag', 'db' );
				$q['tag_slug__in'][] = $q['tag'];
			}
		}

		if ( ! empty( $q['tag_id'] ) ) {
			$q['tag_id'] = absint( $q['tag_id'] );
			$tax_query[] = array(
				'taxonomy' => 'post_tag',
				'terms'    => $q['tag_id'],
			);
		}

		if ( ! empty( $q['tag__in'] ) ) {
			$q['tag__in'] = array_map( 'absint', array_unique( (array) $q['tag__in'] ) );
			$tax_query[]  = array(
				'taxonomy' => 'post_tag',
				'terms'    => $q['tag__in'],
			);
		}

		if ( ! empty( $q['tag__not_in'] ) ) {
			$q['tag__not_in'] = array_map( 'absint', array_unique( (array) $q['tag__not_in'] ) );
			$tax_query[]      = array(
				'taxonomy' => 'post_tag',
				'terms'    => $q['tag__not_in'],
				'operator' => 'NOT IN',
			);
		}

		if ( ! empty( $q['tag__and'] ) ) {
			$q['tag__and'] = array_map( 'absint', array_unique( (array) $q['tag__and'] ) );
			$tax_query[]   = array(
				'taxonomy' => 'post_tag',
				'terms'    => $q['tag__and'],
				'operator' => 'AND',
			);
		}

		if ( ! empty( $q['tag_slug__in'] ) ) {
			$q['tag_slug__in'] = array_map( 'sanitize_title_for_query', array_unique( (array) $q['tag_slug__in'] ) );
			$tax_query[]       = array(
				'taxonomy' => 'post_tag',
				'terms'    => $q['tag_slug__in'],
				'field'    => 'slug',
			);
		}

		if ( ! empty( $q['tag_slug__and'] ) ) {
			$q['tag_slug__and'] = array_map( 'sanitize_title_for_query', array_unique( (array) $q['tag_slug__and'] ) );
			$tax_query[]        = array(
				'taxonomy' => 'post_tag',
				'terms'    => $q['tag_slug__and'],
				'field'    => 'slug',
				'operator' => 'AND',
			);
		}

		$this->tax_query = new WP_Tax_Query( $tax_query );

		/**
		 * Fires after taxonomy-related query vars have been parsed.
		 *
		 * @since 3.7.0
		 *
		 * @param WP_Query $query The WP_Query instance.
		 */
		do_action( 'parse_tax_query', $this );
	}

	/**
	 * Generates SQL for the WHERE clause based on passed search terms.
	 *
	 * @since 3.7.0
	 *
	 * @global wpdb $wpdb WordPress database abstraction object.
	 *
	 * @param array $q Query variables.
	 * @return string WHERE clause.
	 */
	protected function parse_search( &$q ) {
		global $wpdb;

		$search = '';

		// Added slashes screw with quote grouping when done early, so done later.
		$q['s'] = stripslashes( $q['s'] );
		if ( empty( $_GET['s'] ) && $this->is_main_query() ) {
			$q['s'] = urldecode( $q['s'] );
		}
		// There are no line breaks in <input /> fields.
		$q['s']                  = str_replace( array( "\r", "\n" ), '', $q['s'] );
		$q['search_terms_count'] = 1;
		if ( ! empty( $q['sentence'] ) ) {
			$q['search_terms'] = array( $q['s'] );
		} else {
			if ( preg_match_all( '/".*?("|$)|((?<=[\t ",+])|^)[^\t ",+]+/', $q['s'], $matches ) ) {
				$q['search_terms_count'] = count( $matches[0] );
				$q['search_terms']       = $this->parse_search_terms( $matches[0] );
				// If the search string has only short terms or stopwords, or is 10+ terms long, match it as sentence.
				if ( empty( $q['search_terms'] ) || count( $q['search_terms'] ) > 9 ) {
					$q['search_terms'] = array( $q['s'] );
				}
			} else {
				$q['search_terms'] = array( $q['s'] );
			}
		}

		$n                         = ! empty( $q['exact'] ) ? '' : '%';
		$searchand                 = '';
		$q['search_orderby_title'] = array();

		/**
		 * Filters the prefix that indicates that a search term should be excluded from results.
		 *
		 * @since 4.7.0
		 *
		 * @param string $exclusion_prefix The prefix. Default '-'. Returning
		 *                                 an empty value disables exclusions.
		 */
		$exclusion_prefix = apply_filters( 'wp_query_search_exclusion_prefix', '-' );

		foreach ( $q['search_terms'] as $term ) {
			// If there is an $exclusion_prefix, terms prefixed with it should be excluded.
			$exclude = $exclusion_prefix && ( substr( $term, 0, 1 ) === $exclusion_prefix );
			if ( $exclude ) {
				$like_op  = 'NOT LIKE';
				$andor_op = 'AND';
				$term     = substr( $term, 1 );
			} else {
				$like_op  = 'LIKE';
				$andor_op = 'OR';
			}

			if ( $n && ! $exclude ) {
				$like                        = '%' . $wpdb->esc_like( $term ) . '%';
				$q['search_orderby_title'][] = $wpdb->prepare( "{$wpdb->posts}.post_title LIKE %s", $like );
			}

			$like      = $n . $wpdb->esc_like( $term ) . $n;
			$search   .= $wpdb->prepare( "{$searchand}(({$wpdb->posts}.post_title $like_op %s) $andor_op ({$wpdb->posts}.post_excerpt $like_op %s) $andor_op ({$wpdb->posts}.post_content $like_op %s))", $like, $like, $like );
			$searchand = ' AND ';
		}

		if ( ! empty( $search ) ) {
			$search = " AND ({$search}) ";
			if ( ! is_user_logged_in() ) {
				$search .= " AND ({$wpdb->posts}.post_password = '') ";
			}
		}

		return $search;
	}

	/**
	 * Check if the terms are suitable for searching.
	 *
	 * Uses an array of stopwords (terms) that are excluded from the separate
	 * term matching when searching for posts. The list of English stopwords is
	 * the approximate search engines list, and is translatable.
	 *
	 * @since 3.7.0
	 *
	 * @param string[] $terms Array of terms to check.
	 * @return string[] Terms that are not stopwords.
	 */
	protected function parse_search_terms( $terms ) {
		$strtolower = function_exists( 'mb_strtolower' ) ? 'mb_strtolower' : 'strtolower';
		$checked    = array();

		$stopwords = $this->get_search_stopwords();

		foreach ( $terms as $term ) {
			// Keep before/after spaces when term is for exact match.
			if ( preg_match( '/^".+"$/', $term ) ) {
				$term = trim( $term, "\"'" );
			} else {
				$term = trim( $term, "\"' " );
			}

			// Avoid single A-Z and single dashes.
			if ( ! $term || ( 1 === strlen( $term ) && preg_match( '/^[a-z\-]$/i', $term ) ) ) {
				continue;
			}

			if ( in_array( call_user_func( $strtolower, $term ), $stopwords, true ) ) {
				continue;
			}

			$checked[] = $term;
		}

		return $checked;
	}

	/**
	 * Retrieve stopwords used when parsing search terms.
	 *
	 * @since 3.7.0
	 *
	 * @return string[] Stopwords.
	 */
	protected function get_search_stopwords() {
		if ( isset( $this->stopwords ) ) {
			return $this->stopwords;
		}

		/*
		 * translators: This is a comma-separated list of very common words that should be excluded from a search,
		 * like a, an, and the. These are usually called "stopwords". You should not simply translate these individual
		 * words into your language. Instead, look for and provide commonly accepted stopwords in your language.
		 */
		$words = explode(
			',',
			_x(
				'about,an,are,as,at,be,by,com,for,from,how,in,is,it,of,on,or,that,the,this,to,was,what,when,where,who,will,with,www',
				'Comma-separated list of search stopwords in your language'
			)
		);

		$stopwords = array();
		foreach ( $words as $word ) {
			$word = trim( $word, "\r\n\t " );
			if ( $word ) {
				$stopwords[] = $word;
			}
		}

		/**
		 * Filters stopwords used when parsing search terms.
		 *
		 * @since 3.7.0
		 *
		 * @param string[] $stopwords Array of stopwords.
		 */
		$this->stopwords = apply_filters( 'wp_search_stopwords', $stopwords );
		return $this->stopwords;
	}

	/**
	 * Generates SQL for the ORDER BY condition based on passed search terms.
	 *
	 * @since 3.7.0
	 *
	 * @global wpdb $wpdb WordPress database abstraction object.
	 *
	 * @param array $q Query variables.
	 * @return string ORDER BY clause.
	 */
	protected function parse_search_order( &$q ) {
		global $wpdb;

		if ( $q['search_terms_count'] > 1 ) {
			$num_terms = count( $q['search_orderby_title'] );

			// If the search terms contain negative queries, don't bother ordering by sentence matches.
			$like = '';
			if ( ! preg_match( '/(?:\s|^)\-/', $q['s'] ) ) {
				$like = '%' . $wpdb->esc_like( $q['s'] ) . '%';
			}

			$search_orderby = '';

			// Sentence match in 'post_title'.
			if ( $like ) {
				$search_orderby .= $wpdb->prepare( "WHEN {$wpdb->posts}.post_title LIKE %s THEN 1 ", $like );
			}

			// Sanity limit, sort as sentence when more than 6 terms
			// (few searches are longer than 6 terms and most titles are not).
			if ( $num_terms < 7 ) {
				// All words in title.
				$search_orderby .= 'WHEN ' . implode( ' AND ', $q['search_orderby_title'] ) . ' THEN 2 ';
				// Any word in title, not needed when $num_terms == 1.
				if ( $num_terms > 1 ) {
					$search_orderby .= 'WHEN ' . implode( ' OR ', $q['search_orderby_title'] ) . ' THEN 3 ';
				}
			}

			// Sentence match in 'post_content' and 'post_excerpt'.
			if ( $like ) {
				$search_orderby .= $wpdb->prepare( "WHEN {$wpdb->posts}.post_excerpt LIKE %s THEN 4 ", $like );
				$search_orderby .= $wpdb->prepare( "WHEN {$wpdb->posts}.post_content LIKE %s THEN 5 ", $like );
			}

			if ( $search_orderby ) {
				$search_orderby = '(CASE ' . $search_orderby . 'ELSE 6 END)';
			}
		} else {
			// Single word or sentence search.
			$search_orderby = reset( $q['search_orderby_title'] ) . ' DESC';
		}

		return $search_orderby;
	}

	/**
	 * Converts the given orderby alias (if allowed) to a properly-prefixed value.
	 *
	 * @since 4.0.0
	 *
	 * @global wpdb $wpdb WordPress database abstraction object.
	 *
	 * @param string $orderby Alias for the field to order by.
	 * @return string|false Table-prefixed value to used in the ORDER clause. False otherwise.
	 */
	protected function parse_orderby( $orderby ) {
		global $wpdb;

		// Used to filter values.
		$allowed_keys = array(
			'post_name',
			'post_author',
			'post_date',
			'post_title',
			'post_modified',
			'post_parent',
			'post_type',
			'name',
			'author',
			'date',
			'title',
			'modified',
			'parent',
			'type',
			'ID',
			'menu_order',
			'comment_count',
			'rand',
			'post__in',
			'post_parent__in',
			'post_name__in',
		);

		$primary_meta_key   = '';
		$primary_meta_query = false;
		$meta_clauses       = $this->meta_query->get_clauses();
		if ( ! empty( $meta_clauses ) ) {
			$primary_meta_query = reset( $meta_clauses );

			if ( ! empty( $primary_meta_query['key'] ) ) {
				$primary_meta_key = $primary_meta_query['key'];
				$allowed_keys[]   = $primary_meta_key;
			}

			$allowed_keys[] = 'meta_value';
			$allowed_keys[] = 'meta_value_num';
			$allowed_keys   = array_merge( $allowed_keys, array_keys( $meta_clauses ) );
		}

		// If RAND() contains a seed value, sanitize and add to allowed keys.
		$rand_with_seed = false;
		if ( preg_match( '/RAND\(([0-9]+)\)/i', $orderby, $matches ) ) {
			$orderby        = sprintf( 'RAND(%s)', (int) $matches[1] );
			$allowed_keys[] = $orderby;
			$rand_with_seed = true;
		}

		if ( ! in_array( $orderby, $allowed_keys, true ) ) {
			return false;
		}

		$orderby_clause = '';

		switch ( $orderby ) {
			case 'post_name':
			case 'post_author':
			case 'post_date':
			case 'post_title':
			case 'post_modified':
			case 'post_parent':
			case 'post_type':
			case 'ID':
			case 'menu_order':
			case 'comment_count':
				$orderby_clause = "{$wpdb->posts}.{$orderby}";
				break;
			case 'rand':
				$orderby_clause = 'RAND()';
				break;
			case $primary_meta_key:
			case 'meta_value':
				if ( ! empty( $primary_meta_query['type'] ) ) {
					$orderby_clause = "CAST({$primary_meta_query['alias']}.meta_value AS {$primary_meta_query['cast']})";
				} else {
					$orderby_clause = "{$primary_meta_query['alias']}.meta_value";
				}
				break;
			case 'meta_value_num':
				$orderby_clause = "{$primary_meta_query['alias']}.meta_value+0";
				break;
			case 'post__in':
				if ( ! empty( $this->query_vars['post__in'] ) ) {
					$orderby_clause = "FIELD({$wpdb->posts}.ID," . implode( ',', array_map( 'absint', $this->query_vars['post__in'] ) ) . ')';
				}
				break;
			case 'post_parent__in':
				if ( ! empty( $this->query_vars['post_parent__in'] ) ) {
					$orderby_clause = "FIELD( {$wpdb->posts}.post_parent," . implode( ', ', array_map( 'absint', $this->query_vars['post_parent__in'] ) ) . ' )';
				}
				break;
			case 'post_name__in':
				if ( ! empty( $this->query_vars['post_name__in'] ) ) {
					$post_name__in        = array_map( 'sanitize_title_for_query', $this->query_vars['post_name__in'] );
					$post_name__in_string = "'" . implode( "','", $post_name__in ) . "'";
					$orderby_clause       = "FIELD( {$wpdb->posts}.post_name," . $post_name__in_string . ' )';
				}
				break;
			default:
				if ( array_key_exists( $orderby, $meta_clauses ) ) {
					// $orderby corresponds to a meta_query clause.
					$meta_clause    = $meta_clauses[ $orderby ];
					$orderby_clause = "CAST({$meta_clause['alias']}.meta_value AS {$meta_clause['cast']})";
				} elseif ( $rand_with_seed ) {
					$orderby_clause = $orderby;
				} else {
					// Default: order by post field.
					$orderby_clause = "{$wpdb->posts}.post_" . sanitize_key( $orderby );
				}

				break;
		}

		return $orderby_clause;
	}

	/**
	 * Parse an 'order' query variable and cast it to ASC or DESC as necessary.
	 *
	 * @since 4.0.0
	 *
	 * @param string $order The 'order' query variable.
	 * @return string The sanitized 'order' query variable.
	 */
	protected function parse_order( $order ) {
		if ( ! is_string( $order ) || empty( $order ) ) {
			return 'DESC';
		}

		if ( 'ASC' === strtoupper( $order ) ) {
			return 'ASC';
		} else {
			return 'DESC';
		}
	}

	/**
	 * Sets the 404 property and saves whether query is feed.
	 *
	 * @since 2.0.0
	 */
	public function set_404() {
		$is_feed = $this->is_feed;

		$this->init_query_flags();
		$this->is_404 = true;

		$this->is_feed = $is_feed;

		/**
		 * Fires after a 404 is triggered.
		 *
		 * @since 5.5.0
		 *
		 * @param WP_Query $query The WP_Query instance (passed by reference).
		 */
		do_action_ref_array( 'set_404', array( $this ) );
	}

	/**
	 * Retrieves the value of a query variable.
	 *
	 * @since 1.5.0
	 * @since 3.9.0 The `$default_value` argument was introduced.
	 *
	 * @param string $query_var     Query variable key.
	 * @param mixed  $default_value Optional. Value to return if the query variable is not set. Default empty string.
	 * @return mixed Contents of the query variable.
	 */
	public function get( $query_var, $default_value = '' ) {
		if ( isset( $this->query_vars[ $query_var ] ) ) {
			return $this->query_vars[ $query_var ];
		}

		return $default_value;
	}

	/**
	 * Sets the value of a query variable.
	 *
	 * @since 1.5.0
	 *
	 * @param string $query_var Query variable key.
	 * @param mixed  $value     Query variable value.
	 */
	public function set( $query_var, $value ) {
		$this->query_vars[ $query_var ] = $value;
	}

	/**
	 * Retrieves an array of posts based on query variables.
	 *
	 * There are a few filters and actions that can be used to modify the post
	 * database query.
	 *
	 * @since 1.5.0
	 *
	 * @global wpdb $wpdb WordPress database abstraction object.
	 *
	 * @return WP_Post[]|int[] Array of post objects or post IDs.
	 */
	public function get_posts() {
		global $wpdb;

		$this->parse_query();

		/**
		 * Fires after the query variable object is created, but before the actual query is run.
		 *
		 * Note: If using conditional tags, use the method versions within the passed instance
		 * (e.g. $this->is_main_query() instead of is_main_query()). This is because the functions
		 * like is_main_query() test against the global $wp_query instance, not the passed one.
		 *
		 * @since 2.0.0
		 *
		 * @param WP_Query $query The WP_Query instance (passed by reference).
		 */
		do_action_ref_array( 'pre_get_posts', array( &$this ) );

		// Shorthand.
		$q = &$this->query_vars;

		// Fill again in case 'pre_get_posts' unset some vars.
		$q = $this->fill_query_vars( $q );

		// Parse meta query.
		$this->meta_query = new WP_Meta_Query();
		$this->meta_query->parse_query_vars( $q );

		// Set a flag if a 'pre_get_posts' hook changed the query vars.
		$hash = md5( serialize( $this->query_vars ) );
		if ( $hash != $this->query_vars_hash ) {
			$this->query_vars_changed = true;
			$this->query_vars_hash    = $hash;
		}
		unset( $hash );

		// First let's clear some variables.
		$distinct         = '';
		$whichauthor      = '';
		$whichmimetype    = '';
		$where            = '';
		$limits           = '';
		$join             = '';
		$search           = '';
		$groupby          = '';
		$post_status_join = false;
		$page             = 1;

		if ( isset( $q['caller_get_posts'] ) ) {
			_deprecated_argument(
				'WP_Query',
				'3.1.0',
				sprintf(
					/* translators: 1: caller_get_posts, 2: ignore_sticky_posts */
					__( '%1$s is deprecated. Use %2$s instead.' ),
					'<code>caller_get_posts</code>',
					'<code>ignore_sticky_posts</code>'
				)
			);

			if ( ! isset( $q['ignore_sticky_posts'] ) ) {
				$q['ignore_sticky_posts'] = $q['caller_get_posts'];
			}
		}

		if ( ! isset( $q['ignore_sticky_posts'] ) ) {
			$q['ignore_sticky_posts'] = false;
		}

		if ( ! isset( $q['suppress_filters'] ) ) {
			$q['suppress_filters'] = false;
		}

		if ( ! isset( $q['cache_results'] ) ) {
			if ( wp_using_ext_object_cache() ) {
				$q['cache_results'] = false;
			} else {
				$q['cache_results'] = true;
			}
		}

		if ( ! isset( $q['update_post_term_cache'] ) ) {
			$q['update_post_term_cache'] = true;
		}

		if ( ! isset( $q['lazy_load_term_meta'] ) ) {
			$q['lazy_load_term_meta'] = $q['update_post_term_cache'];
		}

		if ( ! isset( $q['update_post_meta_cache'] ) ) {
			$q['update_post_meta_cache'] = true;
		}

		if ( ! isset( $q['post_type'] ) ) {
			if ( $this->is_search ) {
				$q['post_type'] = 'any';
			} else {
				$q['post_type'] = '';
			}
		}
		$post_type = $q['post_type'];
		if ( empty( $q['posts_per_page'] ) ) {
			$q['posts_per_page'] = get_option( 'posts_per_page' );
		}
		if ( isset( $q['showposts'] ) && $q['showposts'] ) {
			$q['showposts']      = (int) $q['showposts'];
			$q['posts_per_page'] = $q['showposts'];
		}
		if ( ( isset( $q['posts_per_archive_page'] ) && 0 != $q['posts_per_archive_page'] ) && ( $this->is_archive || $this->is_search ) ) {
			$q['posts_per_page'] = $q['posts_per_archive_page'];
		}
		if ( ! isset( $q['nopaging'] ) ) {
			if ( -1 == $q['posts_per_page'] ) {
				$q['nopaging'] = true;
			} else {
				$q['nopaging'] = false;
			}
		}

		if ( $this->is_feed ) {
			// This overrides 'posts_per_page'.
			if ( ! empty( $q['posts_per_rss'] ) ) {
				$q['posts_per_page'] = $q['posts_per_rss'];
			} else {
				$q['posts_per_page'] = get_option( 'posts_per_rss' );
			}
			$q['nopaging'] = false;
		}
		$q['posts_per_page'] = (int) $q['posts_per_page'];
		if ( $q['posts_per_page'] < -1 ) {
			$q['posts_per_page'] = abs( $q['posts_per_page'] );
		} elseif ( 0 == $q['posts_per_page'] ) {
			$q['posts_per_page'] = 1;
		}

		if ( ! isset( $q['comments_per_page'] ) || 0 == $q['comments_per_page'] ) {
			$q['comments_per_page'] = get_option( 'comments_per_page' );
		}

		if ( $this->is_home && ( empty( $this->query ) || 'true' === $q['preview'] ) && ( 'page' === get_option( 'show_on_front' ) ) && get_option( 'page_on_front' ) ) {
			$this->is_page = true;
			$this->is_home = false;
			$q['page_id']  = get_option( 'page_on_front' );
		}

		if ( isset( $q['page'] ) ) {
			$q['page'] = trim( $q['page'], '/' );
			$q['page'] = absint( $q['page'] );
		}

		// If true, forcibly turns off SQL_CALC_FOUND_ROWS even when limits are present.
		if ( isset( $q['no_found_rows'] ) ) {
			$q['no_found_rows'] = (bool) $q['no_found_rows'];
		} else {
			$q['no_found_rows'] = false;
		}

		switch ( $q['fields'] ) {
			case 'ids':
				$fields = "{$wpdb->posts}.ID";
				break;
			case 'id=>parent':
				$fields = "{$wpdb->posts}.ID, {$wpdb->posts}.post_parent";
				break;
			default:
				$fields = "{$wpdb->posts}.*";
		}

		if ( '' !== $q['menu_order'] ) {
			$where .= " AND {$wpdb->posts}.menu_order = " . $q['menu_order'];
		}
		// The "m" parameter is meant for months but accepts datetimes of varying specificity.
		if ( $q['m'] ) {
			$where .= " AND YEAR({$wpdb->posts}.post_date)=" . substr( $q['m'], 0, 4 );
			if ( strlen( $q['m'] ) > 5 ) {
				$where .= " AND MONTH({$wpdb->posts}.post_date)=" . substr( $q['m'], 4, 2 );
			}
			if ( strlen( $q['m'] ) > 7 ) {
				$where .= " AND DAYOFMONTH({$wpdb->posts}.post_date)=" . substr( $q['m'], 6, 2 );
			}
			if ( strlen( $q['m'] ) > 9 ) {
				$where .= " AND HOUR({$wpdb->posts}.post_date)=" . substr( $q['m'], 8, 2 );
			}
			if ( strlen( $q['m'] ) > 11 ) {
				$where .= " AND MINUTE({$wpdb->posts}.post_date)=" . substr( $q['m'], 10, 2 );
			}
			if ( strlen( $q['m'] ) > 13 ) {
				$where .= " AND SECOND({$wpdb->posts}.post_date)=" . substr( $q['m'], 12, 2 );
			}
		}

		// Handle the other individual date parameters.
		$date_parameters = array();

		if ( '' !== $q['hour'] ) {
			$date_parameters['hour'] = $q['hour'];
		}

		if ( '' !== $q['minute'] ) {
			$date_parameters['minute'] = $q['minute'];
		}

		if ( '' !== $q['second'] ) {
			$date_parameters['second'] = $q['second'];
		}

		if ( $q['year'] ) {
			$date_parameters['year'] = $q['year'];
		}

		if ( $q['monthnum'] ) {
			$date_parameters['monthnum'] = $q['monthnum'];
		}

		if ( $q['w'] ) {
			$date_parameters['week'] = $q['w'];
		}

		if ( $q['day'] ) {
			$date_parameters['day'] = $q['day'];
		}

		if ( $date_parameters ) {
			$date_query = new WP_Date_Query( array( $date_parameters ) );
			$where     .= $date_query->get_sql();
		}
		unset( $date_parameters, $date_query );

		// Handle complex date queries.
		if ( ! empty( $q['date_query'] ) ) {
			$this->date_query = new WP_Date_Query( $q['date_query'] );
			$where           .= $this->date_query->get_sql();
		}

		// If we've got a post_type AND it's not "any" post_type.
		if ( ! empty( $q['post_type'] ) && 'any' !== $q['post_type'] ) {
			foreach ( (array) $q['post_type'] as $_post_type ) {
				$ptype_obj = get_post_type_object( $_post_type );
				if ( ! $ptype_obj || ! $ptype_obj->query_var || empty( $q[ $ptype_obj->query_var ] ) ) {
					continue;
				}

				if ( ! $ptype_obj->hierarchical ) {
					// Non-hierarchical post types can directly use 'name'.
					$q['name'] = $q[ $ptype_obj->query_var ];
				} else {
					// Hierarchical post types will operate through 'pagename'.
					$q['pagename'] = $q[ $ptype_obj->query_var ];
					$q['name']     = '';
				}

				// Only one request for a slug is possible, this is why name & pagename are overwritten above.
				break;
			} // End foreach.
			unset( $ptype_obj );
		}

		if ( '' !== $q['title'] ) {
			$where .= $wpdb->prepare( " AND {$wpdb->posts}.post_title = %s", stripslashes( $q['title'] ) );
		}

		// Parameters related to 'post_name'.
		if ( '' !== $q['name'] ) {
			$q['name'] = sanitize_title_for_query( $q['name'] );
			$where    .= " AND {$wpdb->posts}.post_name = '" . $q['name'] . "'";
		} elseif ( '' !== $q['pagename'] ) {
			if ( isset( $this->queried_object_id ) ) {
				$reqpage = $this->queried_object_id;
			} else {
				if ( 'page' !== $q['post_type'] ) {
					foreach ( (array) $q['post_type'] as $_post_type ) {
						$ptype_obj = get_post_type_object( $_post_type );
						if ( ! $ptype_obj || ! $ptype_obj->hierarchical ) {
							continue;
						}

						$reqpage = get_page_by_path( $q['pagename'], OBJECT, $_post_type );
						if ( $reqpage ) {
							break;
						}
					}
					unset( $ptype_obj );
				} else {
					$reqpage = get_page_by_path( $q['pagename'] );
				}
				if ( ! empty( $reqpage ) ) {
					$reqpage = $reqpage->ID;
				} else {
					$reqpage = 0;
				}
			}

			$page_for_posts = get_option( 'page_for_posts' );
			if ( ( 'page' !== get_option( 'show_on_front' ) ) || empty( $page_for_posts ) || ( $reqpage != $page_for_posts ) ) {
				$q['pagename'] = sanitize_title_for_query( wp_basename( $q['pagename'] ) );
				$q['name']     = $q['pagename'];
				$where        .= " AND ({$wpdb->posts}.ID = '$reqpage')";
				$reqpage_obj   = get_post( $reqpage );
				if ( is_object( $reqpage_obj ) && 'attachment' === $reqpage_obj->post_type ) {
					$this->is_attachment = true;
					$post_type           = 'attachment';
					$q['post_type']      = 'attachment';
					$this->is_page       = true;
					$q['attachment_id']  = $reqpage;
				}
			}
		} elseif ( '' !== $q['attachment'] ) {
			$q['attachment'] = sanitize_title_for_query( wp_basename( $q['attachment'] ) );
			$q['name']       = $q['attachment'];
			$where          .= " AND {$wpdb->posts}.post_name = '" . $q['attachment'] . "'";
		} elseif ( is_array( $q['post_name__in'] ) && ! empty( $q['post_name__in'] ) ) {
			$q['post_name__in'] = array_map( 'sanitize_title_for_query', $q['post_name__in'] );
			$post_name__in      = "'" . implode( "','", $q['post_name__in'] ) . "'";
			$where             .= " AND {$wpdb->posts}.post_name IN ($post_name__in)";
		}

		// If an attachment is requested by number, let it supersede any post number.
		if ( $q['attachment_id'] ) {
			$q['p'] = absint( $q['attachment_id'] );
		}

		// If a post number is specified, load that post.
		if ( $q['p'] ) {
			$where .= " AND {$wpdb->posts}.ID = " . $q['p'];
		} elseif ( $q['post__in'] ) {
			$post__in = implode( ',', array_map( 'absint', $q['post__in'] ) );
			$where   .= " AND {$wpdb->posts}.ID IN ($post__in)";
		} elseif ( $q['post__not_in'] ) {
			$post__not_in = implode( ',', array_map( 'absint', $q['post__not_in'] ) );
			$where       .= " AND {$wpdb->posts}.ID NOT IN ($post__not_in)";
		}

		if ( is_numeric( $q['post_parent'] ) ) {
			$where .= $wpdb->prepare( " AND {$wpdb->posts}.post_parent = %d ", $q['post_parent'] );
		} elseif ( $q['post_parent__in'] ) {
			$post_parent__in = implode( ',', array_map( 'absint', $q['post_parent__in'] ) );
			$where          .= " AND {$wpdb->posts}.post_parent IN ($post_parent__in)";
		} elseif ( $q['post_parent__not_in'] ) {
			$post_parent__not_in = implode( ',', array_map( 'absint', $q['post_parent__not_in'] ) );
			$where              .= " AND {$wpdb->posts}.post_parent NOT IN ($post_parent__not_in)";
		}

		if ( $q['page_id'] ) {
			if ( ( 'page' !== get_option( 'show_on_front' ) ) || ( get_option( 'page_for_posts' ) != $q['page_id'] ) ) {
				$q['p'] = $q['page_id'];
				$where  = " AND {$wpdb->posts}.ID = " . $q['page_id'];
			}
		}

		// If a search pattern is specified, load the posts that match.
		if ( strlen( $q['s'] ) ) {
			$search = $this->parse_search( $q );
		}

		if ( ! $q['suppress_filters'] ) {
			/**
			 * Filters the search SQL that is used in the WHERE clause of WP_Query.
			 *
			 * @since 3.0.0
			 *
			 * @param string   $search Search SQL for WHERE clause.
			 * @param WP_Query $query  The current WP_Query object.
			 */
			$search = apply_filters_ref_array( 'posts_search', array( $search, &$this ) );
		}

		// Taxonomies.
		if ( ! $this->is_singular ) {
			$this->parse_tax_query( $q );

			$clauses = $this->tax_query->get_sql( $wpdb->posts, 'ID' );

			$join  .= $clauses['join'];
			$where .= $clauses['where'];
		}

		if ( $this->is_tax ) {
			if ( empty( $post_type ) ) {
				// Do a fully inclusive search for currently registered post types of queried taxonomies.
				$post_type  = array();
				$taxonomies = array_keys( $this->tax_query->queried_terms );
				foreach ( get_post_types( array( 'exclude_from_search' => false ) ) as $pt ) {
					$object_taxonomies = 'attachment' === $pt ? get_taxonomies_for_attachments() : get_object_taxonomies( $pt );
					if ( array_intersect( $taxonomies, $object_taxonomies ) ) {
						$post_type[] = $pt;
					}
				}
				if ( ! $post_type ) {
					$post_type = 'any';
				} elseif ( count( $post_type ) == 1 ) {
					$post_type = $post_type[0];
				}

				$post_status_join = true;
			} elseif ( in_array( 'attachment', (array) $post_type, true ) ) {
				$post_status_join = true;
			}
		}

		/*
		 * Ensure that 'taxonomy', 'term', 'term_id', 'cat', and
		 * 'category_name' vars are set for backward compatibility.
		 */
		if ( ! empty( $this->tax_query->queried_terms ) ) {

			/*
			 * Set 'taxonomy', 'term', and 'term_id' to the
			 * first taxonomy other than 'post_tag' or 'category'.
			 */
			if ( ! isset( $q['taxonomy'] ) ) {
				foreach ( $this->tax_query->queried_terms as $queried_taxonomy => $queried_items ) {
					if ( empty( $queried_items['terms'][0] ) ) {
						continue;
					}

					if ( ! in_array( $queried_taxonomy, array( 'category', 'post_tag' ), true ) ) {
						$q['taxonomy'] = $queried_taxonomy;

						if ( 'slug' === $queried_items['field'] ) {
							$q['term'] = $queried_items['terms'][0];
						} else {
							$q['term_id'] = $queried_items['terms'][0];
						}

						// Take the first one we find.
						break;
					}
				}
			}

			// 'cat', 'category_name', 'tag_id'.
			foreach ( $this->tax_query->queried_terms as $queried_taxonomy => $queried_items ) {
				if ( empty( $queried_items['terms'][0] ) ) {
					continue;
				}

				if ( 'category' === $queried_taxonomy ) {
					$the_cat = get_term_by( $queried_items['field'], $queried_items['terms'][0], 'category' );
					if ( $the_cat ) {
						$this->set( 'cat', $the_cat->term_id );
						$this->set( 'category_name', $the_cat->slug );
					}
					unset( $the_cat );
				}

				if ( 'post_tag' === $queried_taxonomy ) {
					$the_tag = get_term_by( $queried_items['field'], $queried_items['terms'][0], 'post_tag' );
					if ( $the_tag ) {
						$this->set( 'tag_id', $the_tag->term_id );
					}
					unset( $the_tag );
				}
			}
		}

		if ( ! empty( $this->tax_query->queries ) || ! empty( $this->meta_query->queries ) ) {
			$groupby = "{$wpdb->posts}.ID";
		}

		// Author/user stuff.

		if ( ! empty( $q['author'] ) && '0' != $q['author'] ) {
			$q['author'] = addslashes_gpc( '' . urldecode( $q['author'] ) );
			$authors     = array_unique( array_map( 'intval', preg_split( '/[,\s]+/', $q['author'] ) ) );
			foreach ( $authors as $author ) {
				$key         = $author > 0 ? 'author__in' : 'author__not_in';
				$q[ $key ][] = abs( $author );
			}
			$q['author'] = implode( ',', $authors );
		}

		if ( ! empty( $q['author__not_in'] ) ) {
			$author__not_in = implode( ',', array_map( 'absint', array_unique( (array) $q['author__not_in'] ) ) );
			$where         .= " AND {$wpdb->posts}.post_author NOT IN ($author__not_in) ";
		} elseif ( ! empty( $q['author__in'] ) ) {
			$author__in = implode( ',', array_map( 'absint', array_unique( (array) $q['author__in'] ) ) );
			$where     .= " AND {$wpdb->posts}.post_author IN ($author__in) ";
		}

		// Author stuff for nice URLs.

		if ( '' !== $q['author_name'] ) {
			if ( strpos( $q['author_name'], '/' ) !== false ) {
				$q['author_name'] = explode( '/', $q['author_name'] );
				if ( $q['author_name'][ count( $q['author_name'] ) - 1 ] ) {
					$q['author_name'] = $q['author_name'][ count( $q['author_name'] ) - 1 ]; // No trailing slash.
				} else {
					$q['author_name'] = $q['author_name'][ count( $q['author_name'] ) - 2 ]; // There was a trailing slash.
				}
			}
			$q['author_name'] = sanitize_title_for_query( $q['author_name'] );
			$q['author']      = get_user_by( 'slug', $q['author_name'] );
			if ( $q['author'] ) {
				$q['author'] = $q['author']->ID;
			}
			$whichauthor .= " AND ({$wpdb->posts}.post_author = " . absint( $q['author'] ) . ')';
		}

		// Matching by comment count.
		if ( isset( $q['comment_count'] ) ) {
			// Numeric comment count is converted to array format.
			if ( is_numeric( $q['comment_count'] ) ) {
				$q['comment_count'] = array(
					'value' => (int) $q['comment_count'],
				);
			}

			if ( isset( $q['comment_count']['value'] ) ) {
				$q['comment_count'] = array_merge(
					array(
						'compare' => '=',
					),
					$q['comment_count']
				);

				// Fallback for invalid compare operators is '='.
				$compare_operators = array( '=', '!=', '>', '>=', '<', '<=' );
				if ( ! in_array( $q['comment_count']['compare'], $compare_operators, true ) ) {
					$q['comment_count']['compare'] = '=';
				}

				$where .= $wpdb->prepare( " AND {$wpdb->posts}.comment_count {$q['comment_count']['compare']} %d", $q['comment_count']['value'] );
			}
		}

		// MIME-Type stuff for attachment browsing.

		if ( isset( $q['post_mime_type'] ) && '' !== $q['post_mime_type'] ) {
			$whichmimetype = wp_post_mime_type_where( $q['post_mime_type'], $wpdb->posts );
		}
		$where .= $search . $whichauthor . $whichmimetype;

		if ( ! empty( $this->meta_query->queries ) ) {
			$clauses = $this->meta_query->get_sql( 'post', $wpdb->posts, 'ID', $this );
			$join   .= $clauses['join'];
			$where  .= $clauses['where'];
		}

		$rand = ( isset( $q['orderby'] ) && 'rand' === $q['orderby'] );
		if ( ! isset( $q['order'] ) ) {
			$q['order'] = $rand ? '' : 'DESC';
		} else {
			$q['order'] = $rand ? '' : $this->parse_order( $q['order'] );
		}

		// These values of orderby should ignore the 'order' parameter.
		$force_asc = array( 'post__in', 'post_name__in', 'post_parent__in' );
		if ( isset( $q['orderby'] ) && in_array( $q['orderby'], $force_asc, true ) ) {
			$q['order'] = '';
		}

		// Order by.
		if ( empty( $q['orderby'] ) ) {
			/*
			 * Boolean false or empty array blanks out ORDER BY,
			 * while leaving the value unset or otherwise empty sets the default.
			 */
			if ( isset( $q['orderby'] ) && ( is_array( $q['orderby'] ) || false === $q['orderby'] ) ) {
				$orderby = '';
			} else {
				$orderby = "{$wpdb->posts}.post_date " . $q['order'];
			}
		} elseif ( 'none' === $q['orderby'] ) {
			$orderby = '';
		} else {
			$orderby_array = array();
			if ( is_array( $q['orderby'] ) ) {
				foreach ( $q['orderby'] as $_orderby => $order ) {
					$orderby = addslashes_gpc( urldecode( $_orderby ) );
					$parsed  = $this->parse_orderby( $orderby );

					if ( ! $parsed ) {
						continue;
					}

					$orderby_array[] = $parsed . ' ' . $this->parse_order( $order );
				}
				$orderby = implode( ', ', $orderby_array );

			} else {
				$q['orderby'] = urldecode( $q['orderby'] );
				$q['orderby'] = addslashes_gpc( $q['orderby'] );

				foreach ( explode( ' ', $q['orderby'] ) as $i => $orderby ) {
					$parsed = $this->parse_orderby( $orderby );
					// Only allow certain values for safety.
					if ( ! $parsed ) {
						continue;
					}

					$orderby_array[] = $parsed;
				}
				$orderby = implode( ' ' . $q['order'] . ', ', $orderby_array );

				if ( empty( $orderby ) ) {
					$orderby = "{$wpdb->posts}.post_date " . $q['order'];
				} elseif ( ! empty( $q['order'] ) ) {
					$orderby .= " {$q['order']}";
				}
			}
		}

		// Order search results by relevance only when another "orderby" is not specified in the query.
		if ( ! empty( $q['s'] ) ) {
			$search_orderby = '';
			if ( ! empty( $q['search_orderby_title'] ) && ( empty( $q['orderby'] ) && ! $this->is_feed ) || ( isset( $q['orderby'] ) && 'relevance' === $q['orderby'] ) ) {
				$search_orderby = $this->parse_search_order( $q );
			}

			if ( ! $q['suppress_filters'] ) {
				/**
				 * Filters the ORDER BY used when ordering search results.
				 *
				 * @since 3.7.0
				 *
				 * @param string   $search_orderby The ORDER BY clause.
				 * @param WP_Query $query          The current WP_Query instance.
				 */
				$search_orderby = apply_filters( 'posts_search_orderby', $search_orderby, $this );
			}

			if ( $search_orderby ) {
				$orderby = $orderby ? $search_orderby . ', ' . $orderby : $search_orderby;
			}
		}

		if ( is_array( $post_type ) && count( $post_type ) > 1 ) {
			$post_type_cap = 'multiple_post_type';
		} else {
			if ( is_array( $post_type ) ) {
				$post_type = reset( $post_type );
			}
			$post_type_object = get_post_type_object( $post_type );
			if ( empty( $post_type_object ) ) {
				$post_type_cap = $post_type;
			}
		}

		if ( isset( $q['post_password'] ) ) {
			$where .= $wpdb->prepare( " AND {$wpdb->posts}.post_password = %s", $q['post_password'] );
			if ( empty( $q['perm'] ) ) {
				$q['perm'] = 'readable';
			}
		} elseif ( isset( $q['has_password'] ) ) {
			$where .= sprintf( " AND {$wpdb->posts}.post_password %s ''", $q['has_password'] ? '!=' : '=' );
		}

		if ( ! empty( $q['comment_status'] ) ) {
			$where .= $wpdb->prepare( " AND {$wpdb->posts}.comment_status = %s ", $q['comment_status'] );
		}

		if ( ! empty( $q['ping_status'] ) ) {
			$where .= $wpdb->prepare( " AND {$wpdb->posts}.ping_status = %s ", $q['ping_status'] );
		}

		$skip_post_status = false;
		if ( 'any' === $post_type ) {
			$in_search_post_types = get_post_types( array( 'exclude_from_search' => false ) );
			if ( empty( $in_search_post_types ) ) {
				$post_type_where  = ' AND 1=0 ';
				$skip_post_status = true;
			} else {
				$post_type_where = " AND {$wpdb->posts}.post_type IN ('" . implode( "', '", array_map( 'esc_sql', $in_search_post_types ) ) . "')";
			}
		} elseif ( ! empty( $post_type ) && is_array( $post_type ) ) {
			$post_type_where = " AND {$wpdb->posts}.post_type IN ('" . implode( "', '", esc_sql( $post_type ) ) . "')";
		} elseif ( ! empty( $post_type ) ) {
			$post_type_where  = $wpdb->prepare( " AND {$wpdb->posts}.post_type = %s", $post_type );
			$post_type_object = get_post_type_object( $post_type );
		} elseif ( $this->is_attachment ) {
			$post_type_where  = " AND {$wpdb->posts}.post_type = 'attachment'";
			$post_type_object = get_post_type_object( 'attachment' );
		} elseif ( $this->is_page ) {
			$post_type_where  = " AND {$wpdb->posts}.post_type = 'page'";
			$post_type_object = get_post_type_object( 'page' );
		} else {
			$post_type_where  = " AND {$wpdb->posts}.post_type = 'post'";
			$post_type_object = get_post_type_object( 'post' );
		}

		$edit_cap = 'edit_post';
		$read_cap = 'read_post';

		if ( ! empty( $post_type_object ) ) {
			$edit_others_cap  = $post_type_object->cap->edit_others_posts;
			$read_private_cap = $post_type_object->cap->read_private_posts;
		} else {
			$edit_others_cap  = 'edit_others_' . $post_type_cap . 's';
			$read_private_cap = 'read_private_' . $post_type_cap . 's';
		}

		$user_id = get_current_user_id();

		$q_status = array();
		if ( $skip_post_status ) {
			$where .= $post_type_where;
		} elseif ( ! empty( $q['post_status'] ) ) {

			$where .= $post_type_where;

			$statuswheres = array();
			$q_status     = $q['post_status'];
			if ( ! is_array( $q_status ) ) {
				$q_status = explode( ',', $q_status );
			}
			$r_status = array();
			$p_status = array();
			$e_status = array();
			if ( in_array( 'any', $q_status, true ) ) {
				foreach ( get_post_stati( array( 'exclude_from_search' => true ) ) as $status ) {
					if ( ! in_array( $status, $q_status, true ) ) {
						$e_status[] = "{$wpdb->posts}.post_status <> '$status'";
					}
				}
			} else {
				foreach ( get_post_stati() as $status ) {
					if ( in_array( $status, $q_status, true ) ) {
						if ( 'private' === $status ) {
							$p_status[] = "{$wpdb->posts}.post_status = '$status'";
						} else {
							$r_status[] = "{$wpdb->posts}.post_status = '$status'";
						}
					}
				}
			}

			if ( empty( $q['perm'] ) || 'readable' !== $q['perm'] ) {
				$r_status = array_merge( $r_status, $p_status );
				unset( $p_status );
			}

			if ( ! empty( $e_status ) ) {
				$statuswheres[] = '(' . implode( ' AND ', $e_status ) . ')';
			}
			if ( ! empty( $r_status ) ) {
				if ( ! empty( $q['perm'] ) && 'editable' === $q['perm'] && ! current_user_can( $edit_others_cap ) ) {
					$statuswheres[] = "({$wpdb->posts}.post_author = $user_id " . 'AND (' . implode( ' OR ', $r_status ) . '))';
				} else {
					$statuswheres[] = '(' . implode( ' OR ', $r_status ) . ')';
				}
			}
			if ( ! empty( $p_status ) ) {
				if ( ! empty( $q['perm'] ) && 'readable' === $q['perm'] && ! current_user_can( $read_private_cap ) ) {
					$statuswheres[] = "({$wpdb->posts}.post_author = $user_id " . 'AND (' . implode( ' OR ', $p_status ) . '))';
				} else {
					$statuswheres[] = '(' . implode( ' OR ', $p_status ) . ')';
				}
			}
			if ( $post_status_join ) {
				$join .= " LEFT JOIN {$wpdb->posts} AS p2 ON ({$wpdb->posts}.post_parent = p2.ID) ";
				foreach ( $statuswheres as $index => $statuswhere ) {
					$statuswheres[ $index ] = "($statuswhere OR ({$wpdb->posts}.post_status = 'inherit' AND " . str_replace( $wpdb->posts, 'p2', $statuswhere ) . '))';
				}
			}
			$where_status = implode( ' OR ', $statuswheres );
			if ( ! empty( $where_status ) ) {
				$where .= " AND ($where_status)";
			}
		} elseif ( ! $this->is_singular ) {
			if ( 'any' === $post_type ) {
				$queried_post_types = get_post_types( array( 'exclude_from_search' => false ) );
			} elseif ( is_array( $post_type ) ) {
				$queried_post_types = $post_type;
			} elseif ( ! empty( $post_type ) ) {
				$queried_post_types = array( $post_type );
			} else {
				$queried_post_types = array( 'post' );
			}

			if ( ! empty( $queried_post_types ) ) {

				$status_type_clauses = array();

				foreach ( $queried_post_types as $queried_post_type ) {

					$queried_post_type_object = get_post_type_object( $queried_post_type );

					$type_where = '(' . $wpdb->prepare( "{$wpdb->posts}.post_type = %s AND (", $queried_post_type );

					// Public statuses.
					$public_statuses = get_post_stati( array( 'public' => true ) );
					$status_clauses  = array();
					foreach ( $public_statuses as $public_status ) {
						$status_clauses[] = "{$wpdb->posts}.post_status = '$public_status'";
					}
					$type_where .= implode( ' OR ', $status_clauses );

					// Add protected states that should show in the admin all list.
					if ( $this->is_admin ) {
						$admin_all_statuses = get_post_stati(
							array(
								'protected'              => true,
								'show_in_admin_all_list' => true,
							)
						);
						foreach ( $admin_all_statuses as $admin_all_status ) {
							$type_where .= " OR {$wpdb->posts}.post_status = '$admin_all_status'";
						}
					}

					// Add private states that are visible to current user.
					if ( is_user_logged_in() && $queried_post_type_object instanceof WP_Post_Type ) {
						$read_private_cap = $queried_post_type_object->cap->read_private_posts;
						$private_statuses = get_post_stati( array( 'private' => true ) );
						foreach ( $private_statuses as $private_status ) {
							$type_where .= current_user_can( $read_private_cap ) ? " \nOR {$wpdb->posts}.post_status = '$private_status'" : " \nOR ({$wpdb->posts}.post_author = $user_id AND {$wpdb->posts}.post_status = '$private_status')";
						}
					}

					$type_where .= '))';

					$status_type_clauses[] = $type_where;
				}

				if ( ! empty( $status_type_clauses ) ) {
					$where .= ' AND (' . implode( ' OR ', $status_type_clauses ) . ')';
				}
			} else {
				$where .= ' AND 1=0 ';
			}
		} else {
			$where .= $post_type_where;
		}

		/*
		 * Apply filters on where and join prior to paging so that any
		 * manipulations to them are reflected in the paging by day queries.
		 */
		if ( ! $q['suppress_filters'] ) {
			/**
			 * Filters the WHERE clause of the query.
			 *
			 * @since 1.5.0
			 *
			 * @param string   $where The WHERE clause of the query.
			 * @param WP_Query $query The WP_Query instance (passed by reference).
			 */
			$where = apply_filters_ref_array( 'posts_where', array( $where, &$this ) );

			/**
			 * Filters the JOIN clause of the query.
			 *
			 * @since 1.5.0
			 *
			 * @param string   $join  The JOIN clause of the query.
			 * @param WP_Query $query The WP_Query instance (passed by reference).
			 */
			$join = apply_filters_ref_array( 'posts_join', array( $join, &$this ) );
		}

		// Paging.
		if ( empty( $q['nopaging'] ) && ! $this->is_singular ) {
			$page = absint( $q['paged'] );
			if ( ! $page ) {
				$page = 1;
			}

			// If 'offset' is provided, it takes precedence over 'paged'.
			if ( isset( $q['offset'] ) && is_numeric( $q['offset'] ) ) {
				$q['offset'] = absint( $q['offset'] );
				$pgstrt      = $q['offset'] . ', ';
			} else {
				$pgstrt = absint( ( $page - 1 ) * $q['posts_per_page'] ) . ', ';
			}
			$limits = 'LIMIT ' . $pgstrt . $q['posts_per_page'];
		}

		// Comments feeds.
		if ( $this->is_comment_feed && ! $this->is_singular ) {
			if ( $this->is_archive || $this->is_search ) {
				$cjoin    = "JOIN {$wpdb->posts} ON ( {$wpdb->comments}.comment_post_ID = {$wpdb->posts}.ID ) $join ";
				$cwhere   = "WHERE comment_approved = '1' $where";
				$cgroupby = "{$wpdb->comments}.comment_id";
			} else { // Other non-singular, e.g. front.
				$cjoin    = "JOIN {$wpdb->posts} ON ( {$wpdb->comments}.comment_post_ID = {$wpdb->posts}.ID )";
				$cwhere   = "WHERE ( post_status = 'publish' OR ( post_status = 'inherit' AND post_type = 'attachment' ) ) AND comment_approved = '1'";
				$cgroupby = '';
			}

			if ( ! $q['suppress_filters'] ) {
				/**
				 * Filters the JOIN clause of the comments feed query before sending.
				 *
				 * @since 2.2.0
				 *
				 * @param string   $cjoin The JOIN clause of the query.
				 * @param WP_Query $query The WP_Query instance (passed by reference).
				 */
				$cjoin = apply_filters_ref_array( 'comment_feed_join', array( $cjoin, &$this ) );

				/**
				 * Filters the WHERE clause of the comments feed query before sending.
				 *
				 * @since 2.2.0
				 *
				 * @param string   $cwhere The WHERE clause of the query.
				 * @param WP_Query $query  The WP_Query instance (passed by reference).
				 */
				$cwhere = apply_filters_ref_array( 'comment_feed_where', array( $cwhere, &$this ) );

				/**
				 * Filters the GROUP BY clause of the comments feed query before sending.
				 *
				 * @since 2.2.0
				 *
				 * @param string   $cgroupby The GROUP BY clause of the query.
				 * @param WP_Query $query    The WP_Query instance (passed by reference).
				 */
				$cgroupby = apply_filters_ref_array( 'comment_feed_groupby', array( $cgroupby, &$this ) );

				/**
				 * Filters the ORDER BY clause of the comments feed query before sending.
				 *
				 * @since 2.8.0
				 *
				 * @param string   $corderby The ORDER BY clause of the query.
				 * @param WP_Query $query    The WP_Query instance (passed by reference).
				 */
				$corderby = apply_filters_ref_array( 'comment_feed_orderby', array( 'comment_date_gmt DESC', &$this ) );

				/**
				 * Filters the LIMIT clause of the comments feed query before sending.
				 *
				 * @since 2.8.0
				 *
				 * @param string   $climits The JOIN clause of the query.
				 * @param WP_Query $query   The WP_Query instance (passed by reference).
				 */
				$climits = apply_filters_ref_array( 'comment_feed_limits', array( 'LIMIT ' . get_option( 'posts_per_rss' ), &$this ) );
			}

			$cgroupby = ( ! empty( $cgroupby ) ) ? 'GROUP BY ' . $cgroupby : '';
			$corderby = ( ! empty( $corderby ) ) ? 'ORDER BY ' . $corderby : '';
			$climits  = ( ! empty( $climits ) ) ? $climits : '';

			$comments_request = "SELECT $distinct {$wpdb->comments}.comment_ID FROM {$wpdb->comments} $cjoin $cwhere $cgroupby $corderby $climits";

			$key          = md5( $comments_request );
			$last_changed = wp_cache_get_last_changed( 'comment' ) . ':' . wp_cache_get_last_changed( 'posts' );

			$cache_key   = "comment_feed:$key:$last_changed";
			$comment_ids = wp_cache_get( $cache_key, 'comment' );
			if ( false === $comment_ids ) {
				$comment_ids = $wpdb->get_col( $comments_request );
				wp_cache_add( $cache_key, $comment_ids, 'comment' );
			}
			_prime_comment_caches( $comment_ids, false );

			// Convert to WP_Comment.
			/** @var WP_Comment[] */
			$this->comments      = array_map( 'get_comment', $comment_ids );
			$this->comment_count = count( $this->comments );

			$post_ids = array();

			foreach ( $this->comments as $comment ) {
				$post_ids[] = (int) $comment->comment_post_ID;
			}

			$post_ids = implode( ',', $post_ids );
			$join     = '';
			if ( $post_ids ) {
				$where = "AND {$wpdb->posts}.ID IN ($post_ids) ";
			} else {
				$where = 'AND 0';
			}
		}

		$pieces = array( 'where', 'groupby', 'join', 'orderby', 'distinct', 'fields', 'limits' );

		/*
		 * Apply post-paging filters on where and join. Only plugins that
		 * manipulate paging queries should use these hooks.
		 */
		if ( ! $q['suppress_filters'] ) {
			/**
			 * Filters the WHERE clause of the query.
			 *
			 * Specifically for manipulating paging queries.
			 *
			 * @since 1.5.0
			 *
			 * @param string   $where The WHERE clause of the query.
			 * @param WP_Query $query The WP_Query instance (passed by reference).
			 */
			$where = apply_filters_ref_array( 'posts_where_paged', array( $where, &$this ) );

			/**
			 * Filters the GROUP BY clause of the query.
			 *
			 * @since 2.0.0
			 *
			 * @param string   $groupby The GROUP BY clause of the query.
			 * @param WP_Query $query   The WP_Query instance (passed by reference).
			 */
			$groupby = apply_filters_ref_array( 'posts_groupby', array( $groupby, &$this ) );

			/**
			 * Filters the JOIN clause of the query.
			 *
			 * Specifically for manipulating paging queries.
			 *
			 * @since 1.5.0
			 *
			 * @param string   $join  The JOIN clause of the query.
			 * @param WP_Query $query The WP_Query instance (passed by reference).
			 */
			$join = apply_filters_ref_array( 'posts_join_paged', array( $join, &$this ) );

			/**
			 * Filters the ORDER BY clause of the query.
			 *
			 * @since 1.5.1
			 *
			 * @param string   $orderby The ORDER BY clause of the query.
			 * @param WP_Query $query   The WP_Query instance (passed by reference).
			 */
			$orderby = apply_filters_ref_array( 'posts_orderby', array( $orderby, &$this ) );

			/**
			 * Filters the DISTINCT clause of the query.
			 *
			 * @since 2.1.0
			 *
			 * @param string   $distinct The DISTINCT clause of the query.
			 * @param WP_Query $query    The WP_Query instance (passed by reference).
			 */
			$distinct = apply_filters_ref_array( 'posts_distinct', array( $distinct, &$this ) );

			/**
			 * Filters the LIMIT clause of the query.
			 *
			 * @since 2.1.0
			 *
			 * @param string   $limits The LIMIT clause of the query.
			 * @param WP_Query $query  The WP_Query instance (passed by reference).
			 */
			$limits = apply_filters_ref_array( 'post_limits', array( $limits, &$this ) );

			/**
			 * Filters the SELECT clause of the query.
			 *
			 * @since 2.1.0
			 *
			 * @param string   $fields The SELECT clause of the query.
			 * @param WP_Query $query  The WP_Query instance (passed by reference).
			 */
			$fields = apply_filters_ref_array( 'posts_fields', array( $fields, &$this ) );

			/**
			 * Filters all query clauses at once, for convenience.
			 *
			 * Covers the WHERE, GROUP BY, JOIN, ORDER BY, DISTINCT,
			 * fields (SELECT), and LIMIT clauses.
			 *
			 * @since 3.1.0
			 *
			 * @param string[] $clauses {
			 *     Associative array of the clauses for the query.
			 *
			 *     @type string $where    The WHERE clause of the query.
			 *     @type string $groupby  The GROUP BY clause of the query.
			 *     @type string $join     The JOIN clause of the query.
			 *     @type string $orderby  The ORDER BY clause of the query.
			 *     @type string $distinct The DISTINCT clause of the query.
			 *     @type string $fields   The SELECT clause of the query.
			 *     @type string $limits   The LIMIT clause of the query.
			 * }
			 * @param WP_Query $query   The WP_Query instance (passed by reference).
			 */
			$clauses = (array) apply_filters_ref_array( 'posts_clauses', array( compact( $pieces ), &$this ) );

			$where    = isset( $clauses['where'] ) ? $clauses['where'] : '';
			$groupby  = isset( $clauses['groupby'] ) ? $clauses['groupby'] : '';
			$join     = isset( $clauses['join'] ) ? $clauses['join'] : '';
			$orderby  = isset( $clauses['orderby'] ) ? $clauses['orderby'] : '';
			$distinct = isset( $clauses['distinct'] ) ? $clauses['distinct'] : '';
			$fields   = isset( $clauses['fields'] ) ? $clauses['fields'] : '';
			$limits   = isset( $clauses['limits'] ) ? $clauses['limits'] : '';
		}

		/**
		 * Fires to announce the query's current selection parameters.
		 *
		 * For use by caching plugins.
		 *
		 * @since 2.3.0
		 *
		 * @param string $selection The assembled selection query.
		 */
		do_action( 'posts_selection', $where . $groupby . $orderby . $limits . $join );

		/*
		 * Filters again for the benefit of caching plugins.
		 * Regular plugins should use the hooks above.
		 */
		if ( ! $q['suppress_filters'] ) {
			/**
			 * Filters the WHERE clause of the query.
			 *
			 * For use by caching plugins.
			 *
			 * @since 2.5.0
			 *
			 * @param string   $where The WHERE clause of the query.
			 * @param WP_Query $query The WP_Query instance (passed by reference).
			 */
			$where = apply_filters_ref_array( 'posts_where_request', array( $where, &$this ) );

			/**
			 * Filters the GROUP BY clause of the query.
			 *
			 * For use by caching plugins.
			 *
			 * @since 2.5.0
			 *
			 * @param string   $groupby The GROUP BY clause of the query.
			 * @param WP_Query $query   The WP_Query instance (passed by reference).
			 */
			$groupby = apply_filters_ref_array( 'posts_groupby_request', array( $groupby, &$this ) );

			/**
			 * Filters the JOIN clause of the query.
			 *
			 * For use by caching plugins.
			 *
			 * @since 2.5.0
			 *
			 * @param string   $join  The JOIN clause of the query.
			 * @param WP_Query $query The WP_Query instance (passed by reference).
			 */
			$join = apply_filters_ref_array( 'posts_join_request', array( $join, &$this ) );

			/**
			 * Filters the ORDER BY clause of the query.
			 *
			 * For use by caching plugins.
			 *
			 * @since 2.5.0
			 *
			 * @param string   $orderby The ORDER BY clause of the query.
			 * @param WP_Query $query   The WP_Query instance (passed by reference).
			 */
			$orderby = apply_filters_ref_array( 'posts_orderby_request', array( $orderby, &$this ) );

			/**
			 * Filters the DISTINCT clause of the query.
			 *
			 * For use by caching plugins.
			 *
			 * @since 2.5.0
			 *
			 * @param string   $distinct The DISTINCT clause of the query.
			 * @param WP_Query $query    The WP_Query instance (passed by reference).
			 */
			$distinct = apply_filters_ref_array( 'posts_distinct_request', array( $distinct, &$this ) );

			/**
			 * Filters the SELECT clause of the query.
			 *
			 * For use by caching plugins.
			 *
			 * @since 2.5.0
			 *
			 * @param string   $fields The SELECT clause of the query.
			 * @param WP_Query $query  The WP_Query instance (passed by reference).
			 */
			$fields = apply_filters_ref_array( 'posts_fields_request', array( $fields, &$this ) );

			/**
			 * Filters the LIMIT clause of the query.
			 *
			 * For use by caching plugins.
			 *
			 * @since 2.5.0
			 *
			 * @param string   $limits The LIMIT clause of the query.
			 * @param WP_Query $query  The WP_Query instance (passed by reference).
			 */
			$limits = apply_filters_ref_array( 'post_limits_request', array( $limits, &$this ) );

			/**
			 * Filters all query clauses at once, for convenience.
			 *
			 * For use by caching plugins.
			 *
			 * Covers the WHERE, GROUP BY, JOIN, ORDER BY, DISTINCT,
			 * fields (SELECT), and LIMIT clauses.
			 *
			 * @since 3.1.0
			 *
			 * @param string[] $clauses {
			 *     Associative array of the clauses for the query.
			 *
			 *     @type string $where    The WHERE clause of the query.
			 *     @type string $groupby  The GROUP BY clause of the query.
			 *     @type string $join     The JOIN clause of the query.
			 *     @type string $orderby  The ORDER BY clause of the query.
			 *     @type string $distinct The DISTINCT clause of the query.
			 *     @type string $fields   The SELECT clause of the query.
			 *     @type string $limits   The LIMIT clause of the query.
			 * }
			 * @param WP_Query $query  The WP_Query instance (passed by reference).
			 */
			$clauses = (array) apply_filters_ref_array( 'posts_clauses_request', array( compact( $pieces ), &$this ) );

			$where    = isset( $clauses['where'] ) ? $clauses['where'] : '';
			$groupby  = isset( $clauses['groupby'] ) ? $clauses['groupby'] : '';
			$join     = isset( $clauses['join'] ) ? $clauses['join'] : '';
			$orderby  = isset( $clauses['orderby'] ) ? $clauses['orderby'] : '';
			$distinct = isset( $clauses['distinct'] ) ? $clauses['distinct'] : '';
			$fields   = isset( $clauses['fields'] ) ? $clauses['fields'] : '';
			$limits   = isset( $clauses['limits'] ) ? $clauses['limits'] : '';
		}

		if ( ! empty( $groupby ) ) {
			$groupby = 'GROUP BY ' . $groupby;
		}
		if ( ! empty( $orderby ) ) {
			$orderby = 'ORDER BY ' . $orderby;
		}

		$found_rows = '';
		if ( ! $q['no_found_rows'] && ! empty( $limits ) ) {
			$found_rows = 'SQL_CALC_FOUND_ROWS';
		}

		$old_request = "
			SELECT $found_rows $distinct $fields
			FROM {$wpdb->posts} $join
			WHERE 1=1 $where
			$groupby
			$orderby
			$limits
		";

		$this->request = $old_request;

		if ( ! $q['suppress_filters'] ) {
			/**
			 * Filters the completed SQL query before sending.
			 *
			 * @since 2.0.0
			 *
			 * @param string   $request The complete SQL query.
			 * @param WP_Query $query   The WP_Query instance (passed by reference).
			 */
			$this->request = apply_filters_ref_array( 'posts_request', array( $this->request, &$this ) );
		}

		/**
		 * Filters the posts array before the query takes place.
		 *
		 * Return a non-null value to bypass WordPress' default post queries.
		 *
		 * Filtering functions that require pagination information are encouraged to set
		 * the `found_posts` and `max_num_pages` properties of the WP_Query object,
		 * passed to the filter by reference. If WP_Query does not perform a database
		 * query, it will not have enough information to generate these values itself.
		 *
		 * @since 4.6.0
		 *
		 * @param WP_Post[]|int[]|null $posts Return an array of post data to short-circuit WP's query,
		 *                                    or null to allow WP to run its normal queries.
		 * @param WP_Query             $query The WP_Query instance (passed by reference).
		 */
		$this->posts = apply_filters_ref_array( 'posts_pre_query', array( null, &$this ) );

		if ( 'ids' === $q['fields'] ) {
			if ( null === $this->posts ) {
				$this->posts = $wpdb->get_col( $this->request );
			}

			/** @var int[] */
			$this->posts      = array_map( 'intval', $this->posts );
			$this->post_count = count( $this->posts );
			$this->set_found_posts( $q, $limits );

			return $this->posts;
		}

		if ( 'id=>parent' === $q['fields'] ) {
			if ( null === $this->posts ) {
				$this->posts = $wpdb->get_results( $this->request );
			}

			$this->post_count = count( $this->posts );
			$this->set_found_posts( $q, $limits );

			/** @var int[] */
			$r = array();
			foreach ( $this->posts as $key => $post ) {
				$this->posts[ $key ]->ID          = (int) $post->ID;
				$this->posts[ $key ]->post_parent = (int) $post->post_parent;

				$r[ (int) $post->ID ] = (int) $post->post_parent;
			}

			return $r;
		}

		if ( null === $this->posts ) {
			$split_the_query = ( $old_request == $this->request && "{$wpdb->posts}.*" === $fields && ! empty( $limits ) && $q['posts_per_page'] < 500 );

			/**
			 * Filters whether to split the query.
			 *
			 * Splitting the query will cause it to fetch just the IDs of the found posts
			 * (and then individually fetch each post by ID), rather than fetching every
			 * complete row at once. One massive result vs. many small results.
			 *
			 * @since 3.4.0
			 *
			 * @param bool     $split_the_query Whether or not to split the query.
			 * @param WP_Query $query           The WP_Query instance.
			 */
			$split_the_query = apply_filters( 'split_the_query', $split_the_query, $this );

			if ( $split_the_query ) {
				// First get the IDs and then fill in the objects.

				$this->request = "
					SELECT $found_rows $distinct {$wpdb->posts}.ID
					FROM {$wpdb->posts} $join
					WHERE 1=1 $where
					$groupby
					$orderby
					$limits
				";

				/**
				 * Filters the Post IDs SQL request before sending.
				 *
				 * @since 3.4.0
				 *
				 * @param string   $request The post ID request.
				 * @param WP_Query $query   The WP_Query instance.
				 */
				$this->request = apply_filters( 'posts_request_ids', $this->request, $this );

				$ids = $wpdb->get_col( $this->request );

				if ( $ids ) {
					$this->posts = $ids;
					$this->set_found_posts( $q, $limits );
					_prime_post_caches( $ids, $q['update_post_term_cache'], $q['update_post_meta_cache'] );
				} else {
					$this->posts = array();
				}
			} else {
				$this->posts = $wpdb->get_results( $this->request );
				$this->set_found_posts( $q, $limits );
			}
		}

		// Convert to WP_Post objects.
		if ( $this->posts ) {
			/** @var WP_Post[] */
			$this->posts = array_map( 'get_post', $this->posts );
		}

		if ( ! $q['suppress_filters'] ) {
			/**
			 * Filters the raw post results array, prior to status checks.
			 *
			 * @since 2.3.0
			 *
			 * @param WP_Post[] $posts Array of post objects.
			 * @param WP_Query  $query The WP_Query instance (passed by reference).
			 */
			$this->posts = apply_filters_ref_array( 'posts_results', array( $this->posts, &$this ) );
		}

		if ( ! empty( $this->posts ) && $this->is_comment_feed && $this->is_singular ) {
			/** This filter is documented in wp-includes/query.php */
			$cjoin = apply_filters_ref_array( 'comment_feed_join', array( '', &$this ) );

			/** This filter is documented in wp-includes/query.php */
			$cwhere = apply_filters_ref_array( 'comment_feed_where', array( "WHERE comment_post_ID = '{$this->posts[0]->ID}' AND comment_approved = '1'", &$this ) );

			/** This filter is documented in wp-includes/query.php */
			$cgroupby = apply_filters_ref_array( 'comment_feed_groupby', array( '', &$this ) );
			$cgroupby = ( ! empty( $cgroupby ) ) ? 'GROUP BY ' . $cgroupby : '';

			/** This filter is documented in wp-includes/query.php */
			$corderby = apply_filters_ref_array( 'comment_feed_orderby', array( 'comment_date_gmt DESC', &$this ) );
			$corderby = ( ! empty( $corderby ) ) ? 'ORDER BY ' . $corderby : '';

			/** This filter is documented in wp-includes/query.php */
			$climits = apply_filters_ref_array( 'comment_feed_limits', array( 'LIMIT ' . get_option( 'posts_per_rss' ), &$this ) );

			$comments_request = "SELECT {$wpdb->comments}.comment_ID FROM {$wpdb->comments} $cjoin $cwhere $cgroupby $corderby $climits";

			$key          = md5( $comments_request );
			$last_changed = wp_cache_get_last_changed( 'comment' );

			$cache_key   = "comment_feed:$key:$last_changed";
			$comment_ids = wp_cache_get( $cache_key, 'comment' );
			if ( false === $comment_ids ) {
				$comment_ids = $wpdb->get_col( $comments_request );
				wp_cache_add( $cache_key, $comment_ids, 'comment' );
			}
			_prime_comment_caches( $comment_ids, false );

			// Convert to WP_Comment.
			/** @var WP_Comment[] */
			$this->comments      = array_map( 'get_comment', $comment_ids );
			$this->comment_count = count( $this->comments );
		}

		// Check post status to determine if post should be displayed.
		if ( ! empty( $this->posts ) && ( $this->is_single || $this->is_page ) ) {
			$status = get_post_status( $this->posts[0] );

			if ( 'attachment' === $this->posts[0]->post_type && 0 === (int) $this->posts[0]->post_parent ) {
				$this->is_page       = false;
				$this->is_single     = true;
				$this->is_attachment = true;
			}

			// If the post_status was specifically requested, let it pass through.
			if ( ! in_array( $status, $q_status, true ) ) {
				$post_status_obj = get_post_status_object( $status );

				if ( $post_status_obj && ! $post_status_obj->public ) {
					if ( ! is_user_logged_in() ) {
						// User must be logged in to view unpublished posts.
						$this->posts = array();
					} else {
						if ( $post_status_obj->protected ) {
							// User must have edit permissions on the draft to preview.
							if ( ! current_user_can( $edit_cap, $this->posts[0]->ID ) ) {
								$this->posts = array();
							} else {
								$this->is_preview = true;
								if ( 'future' !== $status ) {
									$this->posts[0]->post_date = current_time( 'mysql' );
								}
							}
						} elseif ( $post_status_obj->private ) {
							if ( ! current_user_can( $read_cap, $this->posts[0]->ID ) ) {
								$this->posts = array();
							}
						} else {
							$this->posts = array();
						}
					}
				} elseif ( ! $post_status_obj ) {
					// Post status is not registered, assume it's not public.
					if ( ! current_user_can( $edit_cap, $this->posts[0]->ID ) ) {
						$this->posts = array();
					}
				}
			}

			if ( $this->is_preview && $this->posts && current_user_can( $edit_cap, $this->posts[0]->ID ) ) {
				/**
				 * Filters the single post for preview mode.
				 *
				 * @since 2.7.0
				 *
				 * @param WP_Post  $post_preview  The Post object.
				 * @param WP_Query $query         The WP_Query instance (passed by reference).
				 */
				$this->posts[0] = get_post( apply_filters_ref_array( 'the_preview', array( $this->posts[0], &$this ) ) );
			}
		}

		// Put sticky posts at the top of the posts array.
		$sticky_posts = get_option( 'sticky_posts' );
		if ( $this->is_home && $page <= 1 && is_array( $sticky_posts ) && ! empty( $sticky_posts ) && ! $q['ignore_sticky_posts'] ) {
			$num_posts     = count( $this->posts );
			$sticky_offset = 0;
			// Loop over posts and relocate stickies to the front.
			for ( $i = 0; $i < $num_posts; $i++ ) {
				if ( in_array( $this->posts[ $i ]->ID, $sticky_posts, true ) ) {
					$sticky_post = $this->posts[ $i ];
					// Remove sticky from current position.
					array_splice( $this->posts, $i, 1 );
					// Move to front, after other stickies.
					array_splice( $this->posts, $sticky_offset, 0, array( $sticky_post ) );
					// Increment the sticky offset. The next sticky will be placed at this offset.
					$sticky_offset++;
					// Remove post from sticky posts array.
					$offset = array_search( $sticky_post->ID, $sticky_posts, true );
					unset( $sticky_posts[ $offset ] );
				}
			}

			// If any posts have been excluded specifically, Ignore those that are sticky.
			if ( ! empty( $sticky_posts ) && ! empty( $q['post__not_in'] ) ) {
				$sticky_posts = array_diff( $sticky_posts, $q['post__not_in'] );
			}

			// Fetch sticky posts that weren't in the query results.
			if ( ! empty( $sticky_posts ) ) {
				$stickies = get_posts(
					array(
						'post__in'               => $sticky_posts,
						'post_type'              => $post_type,
						'post_status'            => 'publish',
						'posts_per_page'         => count( $sticky_posts ),
						'suppress_filters'       => $q['suppress_filters'],
						'cache_results'          => $q['cache_results'],
						'update_post_meta_cache' => $q['update_post_meta_cache'],
						'update_post_term_cache' => $q['update_post_term_cache'],
						'lazy_load_term_meta'    => $q['lazy_load_term_meta'],
					)
				);

				foreach ( $stickies as $sticky_post ) {
					array_splice( $this->posts, $sticky_offset, 0, array( $sticky_post ) );
					$sticky_offset++;
				}
			}
		}

		// If comments have been fetched as part of the query, make sure comment meta lazy-loading is set up.
		if ( ! empty( $this->comments ) ) {
			wp_queue_comments_for_comment_meta_lazyload( $this->comments );
		}

		if ( ! $q['suppress_filters'] ) {
			/**
			 * Filters the array of retrieved posts after they've been fetched and
			 * internally processed.
			 *
			 * @since 1.5.0
			 *
			 * @param WP_Post[] $posts Array of post objects.
			 * @param WP_Query  $query The WP_Query instance (passed by reference).
			 */
			$this->posts = apply_filters_ref_array( 'the_posts', array( $this->posts, &$this ) );
		}

		// Ensure that any posts added/modified via one of the filters above are
		// of the type WP_Post and are filtered.
		if ( $this->posts ) {
			$this->post_count = count( $this->posts );

			/** @var WP_Post[] */
			$this->posts = array_map( 'get_post', $this->posts );

			if ( $q['cache_results'] ) {
				update_post_caches( $this->posts, $post_type, $q['update_post_term_cache'], $q['update_post_meta_cache'] );
			}

			/** @var WP_Post */
			$this->post = reset( $this->posts );
		} else {
			$this->post_count = 0;
			$this->posts      = array();
		}

		if ( $q['lazy_load_term_meta'] ) {
			wp_queue_posts_for_term_meta_lazyload( $this->posts );
		}

		return $this->posts;
	}

	/**
	 * Set up the amount of found posts and the number of pages (if limit clause was used)
	 * for the current query.
	 *
	 * @since 3.5.0
	 *
	 * @global wpdb $wpdb WordPress database abstraction object.
	 *
	 * @param array  $q      Query variables.
	 * @param string $limits LIMIT clauses of the query.
	 */
	private function set_found_posts( $q, $limits ) {
		global $wpdb;

		// Bail if posts is an empty array. Continue if posts is an empty string,
		// null, or false to accommodate caching plugins that fill posts later.
		if ( $q['no_found_rows'] || ( is_array( $this->posts ) && ! $this->posts ) ) {
			return;
		}

		if ( ! empty( $limits ) ) {
			/**
			 * Filters the query to run for retrieving the found posts.
			 *
			 * @since 2.1.0
			 *
			 * @param string   $found_posts_query The query to run to find the found posts.
			 * @param WP_Query $query             The WP_Query instance (passed by reference).
			 */
			$found_posts_query = apply_filters_ref_array( 'found_posts_query', array( 'SELECT FOUND_ROWS()', &$this ) );

			$this->found_posts = (int) $wpdb->get_var( $found_posts_query );
		} else {
			if ( is_array( $this->posts ) ) {
				$this->found_posts = count( $this->posts );
			} else {
				if ( null === $this->posts ) {
					$this->found_posts = 0;
				} else {
					$this->found_posts = 1;
				}
			}
		}

		/**
		 * Filters the number of found posts for the query.
		 *
		 * @since 2.1.0
		 *
		 * @param int      $found_posts The number of posts found.
		 * @param WP_Query $query       The WP_Query instance (passed by reference).
		 */
		$this->found_posts = (int) apply_filters_ref_array( 'found_posts', array( $this->found_posts, &$this ) );

		if ( ! empty( $limits ) ) {
			$this->max_num_pages = ceil( $this->found_posts / $q['posts_per_page'] );
		}
	}

	/**
	 * Set up the next post and iterate current post index.
	 *
	 * @since 1.5.0
	 *
	 * @return WP_Post Next post.
	 */
	public function next_post() {

		$this->current_post++;

		/** @var WP_Post */
		$this->post = $this->posts[ $this->current_post ];
		return $this->post;
	}

	/**
	 * Sets up the current post.
	 *
	 * Retrieves the next post, sets up the post, sets the 'in the loop'
	 * property to true.
	 *
	 * @since 1.5.0
	 *
	 * @global WP_Post $post Global post object.
	 */
	public function the_post() {
		global $post;
		$this->in_the_loop = true;

		if ( -1 == $this->current_post ) { // Loop has just started.
			/**
			 * Fires once the loop is started.
			 *
			 * @since 2.0.0
			 *
			 * @param WP_Query $query The WP_Query instance (passed by reference).
			 */
			do_action_ref_array( 'loop_start', array( &$this ) );
		}

		$post = $this->next_post();
		$this->setup_postdata( $post );
	}

	/**
	 * Determines whether there are more posts available in the loop.
	 *
	 * Calls the {@see 'loop_end'} action when the loop is complete.
	 *
	 * @since 1.5.0
	 *
	 * @return bool True if posts are available, false if end of the loop.
	 */
	public function have_posts() {
		if ( $this->current_post + 1 < $this->post_count ) {
			return true;
		} elseif ( $this->current_post + 1 == $this->post_count && $this->post_count > 0 ) {
			/**
			 * Fires once the loop has ended.
			 *
			 * @since 2.0.0
			 *
			 * @param WP_Query $query The WP_Query instance (passed by reference).
			 */
			do_action_ref_array( 'loop_end', array( &$this ) );
			// Do some cleaning up after the loop.
			$this->rewind_posts();
		} elseif ( 0 === $this->post_count ) {
			/**
			 * Fires if no results are found in a post query.
			 *
			 * @since 4.9.0
			 *
			 * @param WP_Query $query The WP_Query instance.
			 */
			do_action( 'loop_no_results', $this );
		}

		$this->in_the_loop = false;
		return false;
	}

	/**
	 * Rewind the posts and reset post index.
	 *
	 * @since 1.5.0
	 */
	public function rewind_posts() {
		$this->current_post = -1;
		if ( $this->post_count > 0 ) {
			$this->post = $this->posts[0];
		}
	}

	/**
	 * Iterate current comment index and return WP_Comment object.
	 *
	 * @since 2.2.0
	 *
	 * @return WP_Comment Comment object.
	 */
	public function next_comment() {
		$this->current_comment++;

		/** @var WP_Comment */
		$this->comment = $this->comments[ $this->current_comment ];
		return $this->comment;
	}

	/**
	 * Sets up the current comment.
	 *
	 * @since 2.2.0
	 *
	 * @global WP_Comment $comment Global comment object.
	 */
	public function the_comment() {
		global $comment;

		$comment = $this->next_comment();

		if ( 0 == $this->current_comment ) {
			/**
			 * Fires once the comment loop is started.
			 *
			 * @since 2.2.0
			 */
			do_action( 'comment_loop_start' );
		}
	}

	/**
	 * Whether there are more comments available.
	 *
	 * Automatically rewinds comments when finished.
	 *
	 * @since 2.2.0
	 *
	 * @return bool True if comments are available, false if no more comments.
	 */
	public function have_comments() {
		if ( $this->current_comment + 1 < $this->comment_count ) {
			return true;
		} elseif ( $this->current_comment + 1 == $this->comment_count ) {
			$this->rewind_comments();
		}

		return false;
	}

	/**
	 * Rewind the comments, resets the comment index and comment to first.
	 *
	 * @since 2.2.0
	 */
	public function rewind_comments() {
		$this->current_comment = -1;
		if ( $this->comment_count > 0 ) {
			$this->comment = $this->comments[0];
		}
	}

	/**
	 * Sets up the WordPress query by parsing query string.
	 *
	 * @since 1.5.0
	 *
	 * @see WP_Query::parse_query() for all available arguments.
	 *
	 * @param string|array $query URL query string or array of query arguments.
	 * @return WP_Post[]|int[] Array of post objects or post IDs.
	 */
	public function query( $query ) {
		$this->init();
		$this->query      = wp_parse_args( $query );
		$this->query_vars = $this->query;
		return $this->get_posts();
	}

	/**
	 * Retrieves the currently queried object.
	 *
	 * If queried object is not set, then the queried object will be set from
	 * the category, tag, taxonomy, posts page, single post, page, or author
	 * query variable. After it is set up, it will be returned.
	 *
	 * @since 1.5.0
	 *
	 * @return WP_Term|WP_Post_Type|WP_Post|WP_User|null The queried object.
	 */
	public function get_queried_object() {
		if ( isset( $this->queried_object ) ) {
			return $this->queried_object;
		}

		$this->queried_object    = null;
		$this->queried_object_id = null;

		if ( $this->is_category || $this->is_tag || $this->is_tax ) {
			if ( $this->is_category ) {
				$cat           = $this->get( 'cat' );
				$category_name = $this->get( 'category_name' );

				if ( $cat ) {
					$term = get_term( $cat, 'category' );
				} elseif ( $category_name ) {
					$term = get_term_by( 'slug', $category_name, 'category' );
				}
			} elseif ( $this->is_tag ) {
				$tag_id = $this->get( 'tag_id' );
				$tag    = $this->get( 'tag' );

				if ( $tag_id ) {
					$term = get_term( $tag_id, 'post_tag' );
				} elseif ( $tag ) {
					$term = get_term_by( 'slug', $tag, 'post_tag' );
				}
			} else {
				// For other tax queries, grab the first term from the first clause.
				if ( ! empty( $this->tax_query->queried_terms ) ) {
					$queried_taxonomies = array_keys( $this->tax_query->queried_terms );
					$matched_taxonomy   = reset( $queried_taxonomies );
					$query              = $this->tax_query->queried_terms[ $matched_taxonomy ];

					if ( ! empty( $query['terms'] ) ) {
						if ( 'term_id' === $query['field'] ) {
							$term = get_term( reset( $query['terms'] ), $matched_taxonomy );
						} else {
							$term = get_term_by( $query['field'], reset( $query['terms'] ), $matched_taxonomy );
						}
					}
				}
			}

			if ( ! empty( $term ) && ! is_wp_error( $term ) ) {
				$this->queried_object    = $term;
				$this->queried_object_id = (int) $term->term_id;

				if ( $this->is_category && 'category' === $this->queried_object->taxonomy ) {
					_make_cat_compat( $this->queried_object );
				}
			}
		} elseif ( $this->is_post_type_archive ) {
			$post_type = $this->get( 'post_type' );

			if ( is_array( $post_type ) ) {
				$post_type = reset( $post_type );
			}

			$this->queried_object = get_post_type_object( $post_type );
		} elseif ( $this->is_posts_page ) {
			$page_for_posts = get_option( 'page_for_posts' );

			$this->queried_object    = get_post( $page_for_posts );
			$this->queried_object_id = (int) $this->queried_object->ID;
		} elseif ( $this->is_singular && ! empty( $this->post ) ) {
			$this->queried_object    = $this->post;
			$this->queried_object_id = (int) $this->post->ID;
		} elseif ( $this->is_author ) {
			$author      = (int) $this->get( 'author' );
			$author_name = $this->get( 'author_name' );

			if ( $author ) {
				$this->queried_object_id = $author;
			} elseif ( $author_name ) {
				$user = get_user_by( 'slug', $author_name );

				if ( $user ) {
					$this->queried_object_id = $user->ID;
				}
			}

			$this->queried_object = get_userdata( $this->queried_object_id );
		}

		return $this->queried_object;
	}

	/**
	 * Retrieves the ID of the currently queried object.
	 *
	 * @since 1.5.0
	 *
	 * @return int
	 */
	public function get_queried_object_id() {
		$this->get_queried_object();

		if ( isset( $this->queried_object_id ) ) {
			return $this->queried_object_id;
		}

		return 0;
	}

	/**
	 * Constructor.
	 *
	 * Sets up the WordPress query, if parameter is not empty.
	 *
	 * @since 1.5.0
	 *
	 * @see WP_Query::parse_query() for all available arguments.
	 *
	 * @param string|array $query URL query string or array of vars.
	 */
	public function __construct( $query = '' ) {
		if ( ! empty( $query ) ) {
			$this->query( $query );
		}
	}

	/**
	 * Make private properties readable for backward compatibility.
	 *
	 * @since 4.0.0
	 *
	 * @param string $name Property to get.
	 * @return mixed Property.
	 */
	public function __get( $name ) {
		if ( in_array( $name, $this->compat_fields, true ) ) {
			return $this->$name;
		}
	}

	/**
	 * Make private properties checkable for backward compatibility.
	 *
	 * @since 4.0.0
	 *
	 * @param string $name Property to check if set.
	 * @return bool Whether the property is set.
	 */
	public function __isset( $name ) {
		if ( in_array( $name, $this->compat_fields, true ) ) {
			return isset( $this->$name );
		}
	}

	/**
	 * Make private/protected methods readable for backward compatibility.
	 *
	 * @since 4.0.0
	 *
	 * @param string $name      Method to call.
	 * @param array  $arguments Arguments to pass when calling.
	 * @return mixed|false Return value of the callback, false otherwise.
	 */
	public function __call( $name, $arguments ) {
		if ( in_array( $name, $this->compat_methods, true ) ) {
			return $this->$name( ...$arguments );
		}
		return false;
	}

	/**
	 * Is the query for an existing archive page?
	 *
	 * Archive pages include category, tag, author, date, custom post type,
	 * and custom taxonomy based archives.
	 *
	 * @since 3.1.0
	 *
	 * @see WP_Query::is_category()
	 * @see WP_Query::is_tag()
	 * @see WP_Query::is_author()
	 * @see WP_Query::is_date()
	 * @see WP_Query::is_post_type_archive()
	 * @see WP_Query::is_tax()
	 *
	 * @return bool Whether the query is for an existing archive page.
	 */
	public function is_archive() {
		return (bool) $this->is_archive;
	}

	/**
	 * Is the query for an existing post type archive page?
	 *
	 * @since 3.1.0
	 *
	 * @param string|string[] $post_types Optional. Post type or array of posts types
	 *                                    to check against. Default empty.
	 * @return bool Whether the query is for an existing post type archive page.
	 */
	public function is_post_type_archive( $post_types = '' ) {
		if ( empty( $post_types ) || ! $this->is_post_type_archive ) {
			return (bool) $this->is_post_type_archive;
		}

		$post_type = $this->get( 'post_type' );
		if ( is_array( $post_type ) ) {
			$post_type = reset( $post_type );
		}
		$post_type_object = get_post_type_object( $post_type );

		return in_array( $post_type_object->name, (array) $post_types, true );
	}

	/**
	 * Is the query for an existing attachment page?
	 *
	 * @since 3.1.0
	 *
	 * @param int|string|int[]|string[] $attachment Optional. Attachment ID, title, slug, or array of such
	 *                                              to check against. Default empty.
	 * @return bool Whether the query is for an existing attachment page.
	 */
	public function is_attachment( $attachment = '' ) {
		if ( ! $this->is_attachment ) {
			return false;
		}

		if ( empty( $attachment ) ) {
			return true;
		}

		$attachment = array_map( 'strval', (array) $attachment );

		$post_obj = $this->get_queried_object();

		if ( in_array( (string) $post_obj->ID, $attachment, true ) ) {
			return true;
		} elseif ( in_array( $post_obj->post_title, $attachment, true ) ) {
			return true;
		} elseif ( in_array( $post_obj->post_name, $attachment, true ) ) {
			return true;
		}
		return false;
	}

	/**
	 * Is the query for an existing author archive page?
	 *
	 * If the $author parameter is specified, this function will additionally
	 * check if the query is for one of the authors specified.
	 *
	 * @since 3.1.0
	 *
	 * @param int|string|int[]|string[] $author Optional. User ID, nickname, nicename, or array of such
	 *                                          to check against. Default empty.
	 * @return bool Whether the query is for an existing author archive page.
	 */
	public function is_author( $author = '' ) {
		if ( ! $this->is_author ) {
			return false;
		}

		if ( empty( $author ) ) {
			return true;
		}

		$author_obj = $this->get_queried_object();

		$author = array_map( 'strval', (array) $author );

		if ( in_array( (string) $author_obj->ID, $author, true ) ) {
			return true;
		} elseif ( in_array( $author_obj->nickname, $author, true ) ) {
			return true;
		} elseif ( in_array( $author_obj->user_nicename, $author, true ) ) {
			return true;
		}

		return false;
	}

	/**
	 * Is the query for an existing category archive page?
	 *
	 * If the $category parameter is specified, this function will additionally
	 * check if the query is for one of the categories specified.
	 *
	 * @since 3.1.0
	 *
	 * @param int|string|int[]|string[] $category Optional. Category ID, name, slug, or array of such
	 *                                            to check against. Default empty.
	 * @return bool Whether the query is for an existing category archive page.
	 */
	public function is_category( $category = '' ) {
		if ( ! $this->is_category ) {
			return false;
		}

		if ( empty( $category ) ) {
			return true;
		}

		$cat_obj = $this->get_queried_object();

		$category = array_map( 'strval', (array) $category );

		if ( in_array( (string) $cat_obj->term_id, $category, true ) ) {
			return true;
		} elseif ( in_array( $cat_obj->name, $category, true ) ) {
			return true;
		} elseif ( in_array( $cat_obj->slug, $category, true ) ) {
			return true;
		}

		return false;
	}

	/**
	 * Is the query for an existing tag archive page?
	 *
	 * If the $tag parameter is specified, this function will additionally
	 * check if the query is for one of the tags specified.
	 *
	 * @since 3.1.0
	 *
	 * @param int|string|int[]|string[] $tag Optional. Tag ID, name, slug, or array of such
	 *                                       to check against. Default empty.
	 * @return bool Whether the query is for an existing tag archive page.
	 */
	public function is_tag( $tag = '' ) {
		if ( ! $this->is_tag ) {
			return false;
		}

		if ( empty( $tag ) ) {
			return true;
		}

		$tag_obj = $this->get_queried_object();

		$tag = array_map( 'strval', (array) $tag );

		if ( in_array( (string) $tag_obj->term_id, $tag, true ) ) {
			return true;
		} elseif ( in_array( $tag_obj->name, $tag, true ) ) {
			return true;
		} elseif ( in_array( $tag_obj->slug, $tag, true ) ) {
			return true;
		}

		return false;
	}

	/**
	 * Is the query for an existing custom taxonomy archive page?
	 *
	 * If the $taxonomy parameter is specified, this function will additionally
	 * check if the query is for that specific $taxonomy.
	 *
	 * If the $term parameter is specified in addition to the $taxonomy parameter,
	 * this function will additionally check if the query is for one of the terms
	 * specified.
	 *
	 * @since 3.1.0
	 *
	 * @global WP_Taxonomy[] $wp_taxonomies Registered taxonomies.
	 *
	 * @param string|string[]           $taxonomy Optional. Taxonomy slug or slugs to check against.
	 *                                            Default empty.
	 * @param int|string|int[]|string[] $term     Optional. Term ID, name, slug, or array of such
	 *                                            to check against. Default empty.
	 * @return bool Whether the query is for an existing custom taxonomy archive page.
	 *              True for custom taxonomy archive pages, false for built-in taxonomies
	 *              (category and tag archives).
	 */
	public function is_tax( $taxonomy = '', $term = '' ) {
		global $wp_taxonomies;

		if ( ! $this->is_tax ) {
			return false;
		}

		if ( empty( $taxonomy ) ) {
			return true;
		}

		$queried_object = $this->get_queried_object();
		$tax_array      = array_intersect( array_keys( $wp_taxonomies ), (array) $taxonomy );
		$term_array     = (array) $term;

		// Check that the taxonomy matches.
		if ( ! ( isset( $queried_object->taxonomy ) && count( $tax_array ) && in_array( $queried_object->taxonomy, $tax_array, true ) ) ) {
			return false;
		}

		// Only a taxonomy provided.
		if ( empty( $term ) ) {
			return true;
		}

		return isset( $queried_object->term_id ) &&
			count(
				array_intersect(
					array( $queried_object->term_id, $queried_object->name, $queried_object->slug ),
					$term_array
				)
			);
	}

	/**
	 * Whether the current URL is within the comments popup window.
	 *
	 * @since 3.1.0
	 * @deprecated 4.5.0
	 *
	 * @return false Always returns false.
	 */
	public function is_comments_popup() {
		_deprecated_function( __FUNCTION__, '4.5.0' );

		return false;
	}

	/**
	 * Is the query for an existing date archive?
	 *
	 * @since 3.1.0
	 *
	 * @return bool Whether the query is for an existing date archive.
	 */
	public function is_date() {
		return (bool) $this->is_date;
	}

	/**
	 * Is the query for an existing day archive?
	 *
	 * @since 3.1.0
	 *
	 * @return bool Whether the query is for an existing day archive.
	 */
	public function is_day() {
		return (bool) $this->is_day;
	}

	/**
	 * Is the query for a feed?
	 *
	 * @since 3.1.0
	 *
	 * @param string|string[] $feeds Optional. Feed type or array of feed types
	 *                                         to check against. Default empty.
	 * @return bool Whether the query is for a feed.
	 */
	public function is_feed( $feeds = '' ) {
		if ( empty( $feeds ) || ! $this->is_feed ) {
			return (bool) $this->is_feed;
		}

		$qv = $this->get( 'feed' );
		if ( 'feed' === $qv ) {
			$qv = get_default_feed();
		}

		return in_array( $qv, (array) $feeds, true );
	}

	/**
	 * Is the query for a comments feed?
	 *
	 * @since 3.1.0
	 *
	 * @return bool Whether the query is for a comments feed.
	 */
	public function is_comment_feed() {
		return (bool) $this->is_comment_feed;
	}

	/**
	 * Is the query for the front page of the site?
	 *
	 * This is for what is displayed at your site's main URL.
	 *
	 * Depends on the site's "Front page displays" Reading Settings 'show_on_front' and 'page_on_front'.
	 *
	 * If you set a static page for the front page of your site, this function will return
	 * true when viewing that page.
	 *
	 * Otherwise the same as @see WP_Query::is_home()
	 *
	 * @since 3.1.0
	 *
	 * @return bool Whether the query is for the front page of the site.
	 */
	public function is_front_page() {
		// Most likely case.
		if ( 'posts' === get_option( 'show_on_front' ) && $this->is_home() ) {
			return true;
		} elseif ( 'page' === get_option( 'show_on_front' ) && get_option( 'page_on_front' )
			&& $this->is_page( get_option( 'page_on_front' ) )
		) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * Is the query for the blog homepage?
	 *
	 * This is the page which shows the time based blog content of your site.
	 *
	 * Depends on the site's "Front page displays" Reading Settings 'show_on_front' and 'page_for_posts'.
	 *
	 * If you set a static page for the front page of your site, this function will return
	 * true only on the page you set as the "Posts page".
	 *
	 * @since 3.1.0
	 *
	 * @see WP_Query::is_front_page()
	 *
	 * @return bool Whether the query is for the blog homepage.
	 */
	public function is_home() {
		return (bool) $this->is_home;
	}

	/**
	 * Is the query for the Privacy Policy page?
	 *
	 * This is the page which shows the Privacy Policy content of your site.
	 *
	 * Depends on the site's "Change your Privacy Policy page" Privacy Settings 'wp_page_for_privacy_policy'.
	 *
	 * This function will return true only on the page you set as the "Privacy Policy page".
	 *
	 * @since 5.2.0
	 *
	 * @return bool Whether the query is for the Privacy Policy page.
	 */
	public function is_privacy_policy() {
		if ( get_option( 'wp_page_for_privacy_policy' )
			&& $this->is_page( get_option( 'wp_page_for_privacy_policy' ) )
		) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * Is the query for an existing month archive?
	 *
	 * @since 3.1.0
	 *
	 * @return bool Whether the query is for an existing month archive.
	 */
	public function is_month() {
		return (bool) $this->is_month;
	}

	/**
	 * Is the query for an existing single page?
	 *
	 * If the $page parameter is specified, this function will additionally
	 * check if the query is for one of the pages specified.
	 *
	 * @since 3.1.0
	 *
	 * @see WP_Query::is_single()
	 * @see WP_Query::is_singular()
	 *
	 * @param int|string|int[]|string[] $page Optional. Page ID, title, slug, path, or array of such
	 *                                        to check against. Default empty.
	 * @return bool Whether the query is for an existing single page.
	 */
	public function is_page( $page = '' ) {
		if ( ! $this->is_page ) {
			return false;
		}

		if ( empty( $page ) ) {
			return true;
		}

		$page_obj = $this->get_queried_object();

		$page = array_map( 'strval', (array) $page );

		if ( in_array( (string) $page_obj->ID, $page, true ) ) {
			return true;
		} elseif ( in_array( $page_obj->post_title, $page, true ) ) {
			return true;
		} elseif ( in_array( $page_obj->post_name, $page, true ) ) {
			return true;
		} else {
			foreach ( $page as $pagepath ) {
				if ( ! strpos( $pagepath, '/' ) ) {
					continue;
				}
				$pagepath_obj = get_page_by_path( $pagepath );

				if ( $pagepath_obj && ( $pagepath_obj->ID == $page_obj->ID ) ) {
					return true;
				}
			}
		}

		return false;
	}

	/**
	 * Is the query for a paged result and not for the first page?
	 *
	 * @since 3.1.0
	 *
	 * @return bool Whether the query is for a paged result.
	 */
	public function is_paged() {
		return (bool) $this->is_paged;
	}

	/**
	 * Is the query for a post or page preview?
	 *
	 * @since 3.1.0
	 *
	 * @return bool Whether the query is for a post or page preview.
	 */
	public function is_preview() {
		return (bool) $this->is_preview;
	}

	/**
	 * Is the query for the robots.txt file?
	 *
	 * @since 3.1.0
	 *
	 * @return bool Whether the query is for the robots.txt file.
	 */
	public function is_robots() {
		return (bool) $this->is_robots;
	}

	/**
	 * Is the query for the favicon.ico file?
	 *
	 * @since 5.4.0
	 *
	 * @return bool Whether the query is for the favicon.ico file.
	 */
	public function is_favicon() {
		return (bool) $this->is_favicon;
	}

	/**
	 * Is the query for a search?
	 *
	 * @since 3.1.0
	 *
	 * @return bool Whether the query is for a search.
	 */
	public function is_search() {
		return (bool) $this->is_search;
	}

	/**
	 * Is the query for an existing single post?
	 *
	 * Works for any post type excluding pages.
	 *
	 * If the $post parameter is specified, this function will additionally
	 * check if the query is for one of the Posts specified.
	 *
	 * @since 3.1.0
	 *
	 * @see WP_Query::is_page()
	 * @see WP_Query::is_singular()
	 *
	 * @param int|string|int[]|string[] $post Optional. Post ID, title, slug, path, or array of such
	 *                                        to check against. Default empty.
	 * @return bool Whether the query is for an existing single post.
	 */
	public function is_single( $post = '' ) {
		if ( ! $this->is_single ) {
			return false;
		}

		if ( empty( $post ) ) {
			return true;
		}

		$post_obj = $this->get_queried_object();

		$post = array_map( 'strval', (array) $post );

		if ( in_array( (string) $post_obj->ID, $post, true ) ) {
			return true;
		} elseif ( in_array( $post_obj->post_title, $post, true ) ) {
			return true;
		} elseif ( in_array( $post_obj->post_name, $post, true ) ) {
			return true;
		} else {
			foreach ( $post as $postpath ) {
				if ( ! strpos( $postpath, '/' ) ) {
					continue;
				}
				$postpath_obj = get_page_by_path( $postpath, OBJECT, $post_obj->post_type );

				if ( $postpath_obj && ( $postpath_obj->ID == $post_obj->ID ) ) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * Is the query for an existing single post of any post type (post, attachment, page,
	 * custom post types)?
	 *
	 * If the $post_types parameter is specified, this function will additionally
	 * check if the query is for one of the Posts Types specified.
	 *
	 * @since 3.1.0
	 *
	 * @see WP_Query::is_page()
	 * @see WP_Query::is_single()
	 *
	 * @param string|string[] $post_types Optional. Post type or array of post types
	 *                                    to check against. Default empty.
	 * @return bool Whether the query is for an existing single post
	 *              or any of the given post types.
	 */
	public function is_singular( $post_types = '' ) {
		if ( empty( $post_types ) || ! $this->is_singular ) {
			return (bool) $this->is_singular;
		}

		$post_obj = $this->get_queried_object();

		return in_array( $post_obj->post_type, (array) $post_types, true );
	}

	/**
	 * Is the query for a specific time?
	 *
	 * @since 3.1.0
	 *
	 * @return bool Whether the query is for a specific time.
	 */
	public function is_time() {
		return (bool) $this->is_time;
	}

	/**
	 * Is the query for a trackback endpoint call?
	 *
	 * @since 3.1.0
	 *
	 * @return bool Whether the query is for a trackback endpoint call.
	 */
	public function is_trackback() {
		return (bool) $this->is_trackback;
	}

	/**
	 * Is the query for an existing year archive?
	 *
	 * @since 3.1.0
	 *
	 * @return bool Whether the query is for an existing year archive.
	 */
	public function is_year() {
		return (bool) $this->is_year;
	}

	/**
	 * Is the query a 404 (returns no results)?
	 *
	 * @since 3.1.0
	 *
	 * @return bool Whether the query is a 404 error.
	 */
	public function is_404() {
		return (bool) $this->is_404;
	}

	/**
	 * Is the query for an embedded post?
	 *
	 * @since 4.4.0
	 *
	 * @return bool Whether the query is for an embedded post.
	 */
	public function is_embed() {
		return (bool) $this->is_embed;
	}

	/**
	 * Is the query the main query?
	 *
	 * @since 3.3.0
	 *
	 * @global WP_Query $wp_query WordPress Query object.
	 *
	 * @return bool Whether the query is the main query.
	 */
	public function is_main_query() {
		global $wp_the_query;
		return $wp_the_query === $this;
	}

	/**
	 * Set up global post data.
	 *
	 * @since 4.1.0
	 * @since 4.4.0 Added the ability to pass a post ID to `$post`.
	 *
	 * @global int     $id
	 * @global WP_User $authordata
	 * @global string  $currentday
	 * @global string  $currentmonth
	 * @global int     $page
	 * @global array   $pages
	 * @global int     $multipage
	 * @global int     $more
	 * @global int     $numpages
	 *
	 * @param WP_Post|object|int $post WP_Post instance or Post ID/object.
	 * @return true True when finished.
	 */
	public function setup_postdata( $post ) {
		global $id, $authordata, $currentday, $currentmonth, $page, $pages, $multipage, $more, $numpages;

		if ( ! ( $post instanceof WP_Post ) ) {
			$post = get_post( $post );
		}

		if ( ! $post ) {
			return;
		}

		$elements = $this->generate_postdata( $post );
		if ( false === $elements ) {
			return;
		}

		$id           = $elements['id'];
		$authordata   = $elements['authordata'];
		$currentday   = $elements['currentday'];
		$currentmonth = $elements['currentmonth'];
		$page         = $elements['page'];
		$pages        = $elements['pages'];
		$multipage    = $elements['multipage'];
		$more         = $elements['more'];
		$numpages     = $elements['numpages'];

		/**
		 * Fires once the post data has been set up.
		 *
		 * @since 2.8.0
		 * @since 4.1.0 Introduced `$query` parameter.
		 *
		 * @param WP_Post  $post  The Post object (passed by reference).
		 * @param WP_Query $query The current Query object (passed by reference).
		 */
		do_action_ref_array( 'the_post', array( &$post, &$this ) );

		return true;
	}

	/**
	 * Generate post data.
	 *
	 * @since 5.2.0
	 *
	 * @param WP_Post|object|int $post WP_Post instance or Post ID/object.
	 * @return array|false Elements of post or false on failure.
	 */
	public function generate_postdata( $post ) {

		if ( ! ( $post instanceof WP_Post ) ) {
			$post = get_post( $post );
		}

		if ( ! $post ) {
			return false;
		}

		$id = (int) $post->ID;

		$authordata = get_userdata( $post->post_author );

		$currentday   = mysql2date( 'd.m.y', $post->post_date, false );
		$currentmonth = mysql2date( 'm', $post->post_date, false );
		$numpages     = 1;
		$multipage    = 0;
		$page         = $this->get( 'page' );
		if ( ! $page ) {
			$page = 1;
		}

		/*
		 * Force full post content when viewing the permalink for the $post,
		 * or when on an RSS feed. Otherwise respect the 'more' tag.
		 */
		if ( get_queried_object_id() === $post->ID && ( $this->is_page() || $this->is_single() ) ) {
			$more = 1;
		} elseif ( $this->is_feed() ) {
			$more = 1;
		} else {
			$more = 0;
		}

		$content = $post->post_content;
		if ( false !== strpos( $content, '<!--nextpage-->' ) ) {
			$content = str_replace( "\n<!--nextpage-->\n", '<!--nextpage-->', $content );
			$content = str_replace( "\n<!--nextpage-->", '<!--nextpage-->', $content );
			$content = str_replace( "<!--nextpage-->\n", '<!--nextpage-->', $content );

			// Remove the nextpage block delimiters, to avoid invalid block structures in the split content.
			$content = str_replace( '<!-- wp:nextpage -->', '', $content );
			$content = str_replace( '<!-- /wp:nextpage -->', '', $content );

			// Ignore nextpage at the beginning of the content.
			if ( 0 === strpos( $content, '<!--nextpage-->' ) ) {
				$content = substr( $content, 15 );
			}

			$pages = explode( '<!--nextpage-->', $content );
		} else {
			$pages = array( $post->post_content );
		}

		/**
		 * Filters the "pages" derived from splitting the post content.
		 *
		 * "Pages" are determined by splitting the post content based on the presence
		 * of `<!-- nextpage -->` tags.
		 *
		 * @since 4.4.0
		 *
		 * @param string[] $pages Array of "pages" from the post content split by `<!-- nextpage -->` tags.
		 * @param WP_Post  $post  Current post object.
		 */
		$pages = apply_filters( 'content_pagination', $pages, $post );

		$numpages = count( $pages );

		if ( $numpages > 1 ) {
			if ( $page > 1 ) {
				$more = 1;
			}
			$multipage = 1;
		} else {
			$multipage = 0;
		}

		$elements = compact( 'id', 'authordata', 'currentday', 'currentmonth', 'page', 'pages', 'multipage', 'more', 'numpages' );

		return $elements;
	}
	/**
	 * After looping through a nested query, this function
	 * restores the $post global to the current post in this query.
	 *
	 * @since 3.7.0
	 *
	 * @global WP_Post $post Global post object.
	 */
	public function reset_postdata() {
		if ( ! empty( $this->post ) ) {
			$GLOBALS['post'] = $this->post;
			$this->setup_postdata( $this->post );
		}
	}

	/**
	 * Lazyload term meta for posts in the loop.
	 *
	 * @since 4.4.0
	 * @deprecated 4.5.0 See wp_queue_posts_for_term_meta_lazyload().
	 *
	 * @param mixed $check
	 * @param int   $term_id
	 * @return mixed
	 */
	public function lazyload_term_meta( $check, $term_id ) {
		_deprecated_function( __METHOD__, '4.5.0' );
		return $check;
	}

	/**
	 * Lazyload comment meta for comments in the loop.
	 *
	 * @since 4.4.0
	 * @deprecated 4.5.0 See wp_queue_comments_for_comment_meta_lazyload().
	 *
	 * @param mixed $check
	 * @param int   $comment_id
	 * @return mixed
	 */
	public function lazyload_comment_meta( $check, $comment_id ) {
		_deprecated_function( __METHOD__, '4.5.0' );
		return $check;
	}
}

```