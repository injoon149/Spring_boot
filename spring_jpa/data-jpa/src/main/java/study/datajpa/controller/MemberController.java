package study.datajpa.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.*;
import study.datajpa.domain.Member;
import study.datajpa.dto.MemberDto;
import study.datajpa.repository.MemberRepository;

@RestController
@RequiredArgsConstructor
public class MemberController {
    private final MemberRepository memberRepository;

    @GetMapping("/members/{id}")
    public String findMember(@PathVariable("id")Member member) {
        return member.getUsername();
    }

    @GetMapping("/members")
    public Page<MemberDto> list(@PageableDefault(size = 12, sort = "username",
    direction = Sort.Direction.DESC) Pageable pageable)
    {
        Page<Member> page = memberRepository.findAll(pageable);
        Page<MemberDto> pageDto = page.map(member -> new MemberDto(member.getId(), member.getUsername(),
                member.getTeam().getName()));
        return pageDto;
    }



}
