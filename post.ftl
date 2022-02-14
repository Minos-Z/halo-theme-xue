<#include "module/macro.ftl">
<@layout title="${post.title!} | ${options.blog_title!}">
  <main class="mx-auto" id="container">
    <header class="bg-cover post-cover table relative w-full opacity-95" id="postHeader">
        <#if post.thumbnail?? && post.thumbnail!=''>
          <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
            <img src="${post.thumbnail!}" class="z-auto" alt="${post.title!}">
          </div>
        <#elseif settings.card_random_cover_list?? && settings.card_random_cover_list != ''>
          <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">
            <img src="${theme_base!}/source/images/loading.svg" class="z-auto img-random" alt="${post.title}"/>
          </div>
        <#else>
          <div class="placeholder-bg">
          </div>
        </#if>
      <div class="cover-content table-cell post-cover-content relative w-full index flex justify-center">
        <!-- 封面内容 -->
        <div class="inner flex flex-col justify-center pt-40 pb-40">
          <p class="post-title cover-title text-white mb-5 mt-4 leading-loose relative w-full text-left text-4xl">${post.title!}</p>
          <div class="post-meta">
            <div class="post-meta-wrap">
              <img class="author-avatar"
                   srcset="${user.avatar!}, ${user.avatar!} 2x"
                   src="${user.avatar!}" alt=""/>
              <span class="post-author">${post.visits} 次访问</span>
              <time class="published"
                    datetime="${post.createTime?string("yyyy-MM-dd")}">
                发布: ${post.createTime?string("yyyy-MM-dd")}</time>
                <#if "${post.createTime}" != "${post.editTime}">
                  <time class="published"
                        datetime="${post.editTime?string("yyyy-MM-dd")}">
                    最后编辑: ${post.editTime?string("yyyy-MM-dd")}</time>
                </#if>
            </div>
            <div class="text-center post-categories">
                <#if post.categories?? && post.categories?size gt 0>
                  <span class="iconfont icon-folder"> </span>
                </#if>
                <#if post.categories?? && post.categories?size gt 0>

                    <#list post.categories as category>
                      <a href="${category.fullPath!}" class="post-category">
                        · ${category.name!}
                      </a>
                    </#list>
                </#if>
            </div>
          </div>
        </div>
      </div>
    </header>
    <div class="article-content content-container">
      <div id="gallery-content" class="mx-auto px-10 md-content mt-8 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal cn-pd ct-container heti">
        ${post.formatContent!}
      </div>
      <div id="tocFlag"></div>
        <#if settings.post_toc!true>
          <aside id="toc" class="toc"></aside>
        </#if>
    </div>

    <div
      class="mx-auto px-10 mt-8 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ct-container coffee-tags">
      <blockquote class="post-copyright">
        <p><b>Copyright: </b> 采用 <a href="https://creativecommons.org/licenses/by/4.0/"
                                    target="_blank"
                                    rel="external nofollow">知识共享署名4.0</a> 国际许可协议进行许可</p>
        <p><b>Links: </b> <a href="${post.fullPath!}">${post.fullPath!}</a></p>
      </blockquote>
        <#include "module/widget/sponsor.ftl">
    </div>


    <div
      class="mx-auto px-10 mt-8 pb-4 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal coffee-tags ct-container">
      <p class="flex flex-row justify-start flex-wrap">
          <#if post.tags?? && post.tags?size gt 0>
              <#list post.tags as tag>
                <a href="${tag.fullPath!}" class="post-tag mt-2 mb-2 mr-2">
                  #&nbsp;${tag.name!}
                </a>
              </#list>
          </#if>
      </p>
      <hr class="mt-4" style="background-color: rgba(96, 125, 139, .05); size: 2px;">
    </div>

    <!-- 上一篇和下一篇 -->
      <#if settings.post_nepre!true>
          <#include "module/widget/prev_next_page.ftl">
      </#if>

    <div
      class="mx-auto px-10 mt-16 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ct-container">
        <#include "module/comment.ftl">
        <@comment post,"post" />
    </div>
  </main>
</@layout>



